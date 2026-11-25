import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class ProductEndpoint extends Endpoint {
  Future<List<Product>> getProducts(
    Session session, {
    int offset = 0,
    int limit = 24,
  }) async {
    return _filtered(
      session,
      offset: offset,
      limit: limit,
      publishedOnly: true,
    );
  }

  Future<Product?> getProductById(Session session, int id) async {
    return Product.db.findById(session, id);
  }

  Future<Product?> getProductBySlug(Session session, String slug) async {
    return Product.db.findFirstRow(
      session,
      where: (t) => t.slug.equals(slug) & t.published.equals(true),
    );
  }

  Future<List<Product>> getFeaturedProducts(Session session) =>
      _filtered(session, featuredOnly: true, limit: 24);

  Future<List<Product>> getNewArrivals(Session session) =>
      _filtered(session, newOnly: true, limit: 24);

  Future<List<Product>> getBestSellers(Session session) =>
      _filtered(session, bestSellerOnly: true, limit: 24);

  Future<List<Product>> searchProducts(
    Session session,
    String query, {
    int offset = 0,
    int limit = 24,
  }) async => _filtered(
    session,
    query: query,
    offset: offset,
    limit: limit,
  );

  Future<List<Product>> getProductsByCategory(
    Session session,
    String category, {
    int offset = 0,
    int limit = 24,
  }) async => _filtered(
    session,
    category: category,
    offset: offset,
    limit: limit,
  );

  Future<List<Product>> getProductsWithFilters(
    Session session, {
    String? category,
    String? gender,
    String? query,
    String? size,
    String? color,
    double? minPrice,
    double? maxPrice,
    bool featuredOnly = false,
    bool newOnly = false,
    bool bestSellerOnly = false,
    String sort = 'newest',
    int offset = 0,
    int limit = 24,
  }) async {
    var products = await _filtered(
      session,
      category: category,
      gender: gender,
      query: query,
      size: size,
      color: color,
      minPrice: minPrice,
      maxPrice: maxPrice,
      featuredOnly: featuredOnly,
      newOnly: newOnly,
      bestSellerOnly: bestSellerOnly,
      limit: 1000,
    );

    switch (sort) {
      case 'price-low':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'price-high':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'rating':
        products.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'popular':
        products.sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
        break;
      default:
        products.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }

    final safeOffset = offset < 0 ? 0 : offset;
    final safeLimit = limit < 1 ? 24 : limit;
    if (safeOffset >= products.length) return [];
    final end = (safeOffset + safeLimit).clamp(0, products.length);
    return products.sublist(safeOffset, end);
  }

  Future<List<ProductVariant>> getProductVariants(
    Session session,
    int productId,
  ) async {
    return ProductVariant.db.find(
      session,
      where: (t) => t.productId.equals(productId),
    );
  }

  Future<List<Product>> list(
    Session session, {
    String? category,
    String? gender,
    String? query,
    bool featuredOnly = false,
    bool newOnly = false,
  }) async => _filtered(
    session,
    category: category,
    gender: gender,
    query: query,
    featuredOnly: featuredOnly,
    newOnly: newOnly,
    limit: 24,
  );

  Future<List<Product>> _filtered(
    Session session, {
    String? category,
    String? gender,
    String? query,
    String? size,
    String? color,
    double? minPrice,
    double? maxPrice,
    bool featuredOnly = false,
    bool newOnly = false,
    bool bestSellerOnly = false,
    int offset = 0,
    int limit = 24,
    bool publishedOnly = true,
  }) async {
    var products = await Product.db.find(
      session,
      where: publishedOnly ? (t) => t.published.equals(true) : null,
    );

    if (category != null && category.isNotEmpty) {
      products = products.where((p) => p.category == category).toList();
    }
    if (gender != null && gender.isNotEmpty) {
      products = products
          .where((p) => p.gender == gender || p.gender == 'Unisex')
          .toList();
    }
    if (featuredOnly) {
      products = products.where((p) => p.featured).toList();
    }
    if (newOnly) {
      products = products.where((p) => p.newArrival).toList();
    }
    if (bestSellerOnly) {
      products = products.where((p) => p.bestSeller).toList();
    }
    if (size != null && size.isNotEmpty) {
      products = products
          .where((p) => p.sizes.split(',').contains(size))
          .toList();
    }
    if (color != null && color.isNotEmpty) {
      products = products
          .where((p) => p.colors.toLowerCase().contains(color.toLowerCase()))
          .toList();
    }
    if (minPrice != null) {
      products = products.where((p) => p.price >= minPrice).toList();
    }
    if (maxPrice != null) {
      products = products.where((p) => p.price <= maxPrice).toList();
    }
    if (query != null && query.trim().isNotEmpty) {
      final needle = query.trim().toLowerCase();
      products = products
          .where(
            (p) =>
                p.name.toLowerCase().contains(needle) ||
                p.brand.toLowerCase().contains(needle) ||
                p.category.toLowerCase().contains(needle) ||
                p.description.toLowerCase().contains(needle),
          )
          .toList();
    }

    products.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    final safeOffset = offset < 0 ? 0 : offset;
    final safeLimit = limit < 1 ? 24 : limit;
    if (safeOffset >= products.length) return [];
    final end = (safeOffset + safeLimit).clamp(0, products.length);
    return products.sublist(safeOffset, end);
  }

  Future<int> seed(Session session) async {
    final existing = await Product.db.count(session);
    if (existing >= 12) return existing;

    final now = DateTime.now();
    final seed = <Product>[
      _product(
        now,
        'Aero 01',
        'aero-01',
        'Running',
        'Unisex',
        'A lightweight everyday runner with responsive cushioning.',
        189,
        220,
        14,
        'Volt,Black,White',
        '7,8,9,10,11,12',
        42,
        true,
        true,
        true,
        'photo-1542291026-7eec264c27ff',
        'photo-1549298916-b41d501d3772',
      ),
      _product(
        now.subtract(const Duration(days: 1)),
        'Mono Court',
        'mono-court',
        'Lifestyle',
        'Men',
        'Clean court lines with premium leather texture.',
        164,
        164,
        0,
        'Black,Cream',
        '7,8,9,10,11',
        26,
        true,
        true,
        false,
        'photo-1549298916-b41d501d3772',
        'photo-1552346154-21d32810aba3',
      ),
      _product(
        now.subtract(const Duration(days: 2)),
        'Flux Runner',
        'flux-runner',
        'Running',
        'Women',
        'A fluid trainer balancing soft landings and airflow.',
        176,
        210,
        16,
        'Silver,Lime',
        '5,6,7,8,9,10',
        31,
        true,
        false,
        true,
        'photo-1552346154-21d32810aba3',
        'photo-1491553895911-0055eca6402d',
      ),
      _product(
        now.subtract(const Duration(days: 3)),
        'Form 95',
        'form-95',
        'Lifestyle',
        'Unisex',
        'Technical proportions with an understated upper.',
        210,
        250,
        16,
        'White,Orange,Black',
        '6,7,8,9,10,11,12',
        18,
        false,
        true,
        true,
        'photo-1491553895911-0055eca6402d',
        'photo-1460353581641-37baddab0fa2',
      ),
      _product(
        now.subtract(const Duration(days: 4)),
        'Night Shift',
        'night-shift',
        'Training',
        'Men',
        'Stable training silhouette for high-intensity days.',
        198,
        198,
        0,
        'Black,Graphite',
        '8,9,10,11,12',
        22,
        true,
        false,
        false,
        'photo-1608231387042-66d1773070a5',
        'photo-1600185365483-26d7a4cc7519',
      ),
      _product(
        now.subtract(const Duration(days: 5)),
        'Cloud Veil',
        'cloud-veil',
        'Running',
        'Women',
        'Soft cushioning in a quiet, all-white profile.',
        185,
        220,
        16,
        'White,Sand',
        '5,6,7,8,9',
        35,
        true,
        true,
        true,
        'photo-1595950653106-6c9ebd614d3a',
        'photo-1560769629-975ec94e6a86',
      ),
      _product(
        now.subtract(const Duration(days: 6)),
        'Street 77',
        'street-77',
        'Lifestyle',
        'Unisex',
        'A low-profile street sneaker with sharp overlays.',
        158,
        180,
        12,
        'Blue,White,Red',
        '6,7,8,9,10,11,12',
        40,
        false,
        true,
        false,
        'photo-1460353581641-37baddab0fa2',
        'photo-1543508282-6319a3e2621f',
      ),
      _product(
        now.subtract(const Duration(days: 7)),
        'Alpine 3',
        'alpine-3',
        'Outdoor',
        'Men',
        'A rugged, weather-ready sole in an alpine palette.',
        235,
        280,
        16,
        'Grey,Olive',
        '8,9,10,11,12',
        14,
        true,
        false,
        false,
        'photo-1525966222134-fcfa99b8ae77',
        'photo-1560343090-f0409e92791a',
      ),
      _product(
        now.subtract(const Duration(days: 8)),
        'Nova Knit',
        'nova-knit',
        'Running',
        'Women',
        'Flexible knit construction for long urban miles.',
        172,
        172,
        0,
        'Lilac,White',
        '5,6,7,8,9,10',
        28,
        false,
        false,
        true,
        'photo-1560769629-975ec94e6a86',
        'photo-1595950653106-6c9ebd614d3a',
      ),
      _product(
        now.subtract(const Duration(days: 9)),
        'Axis 200',
        'axis-200',
        'Training',
        'Unisex',
        'Balanced support and visible heel stability.',
        192,
        240,
        20,
        'Orange,Black',
        '7,8,9,10,11,12',
        33,
        true,
        true,
        false,
        'photo-1600185365483-26d7a4cc7519',
        'photo-1608231387042-66d1773070a5',
      ),
      _product(
        now.subtract(const Duration(days: 10)),
        'Palette 02',
        'palette-02',
        'Lifestyle',
        'Women',
        'A refined colour-blocked sneaker for everyday wear.',
        168,
        168,
        0,
        'Pink,Cream',
        '5,6,7,8,9',
        24,
        false,
        false,
        true,
        'photo-1560343090-f0409e92791a',
        'photo-1525966222134-fcfa99b8ae77',
      ),
      _product(
        now.subtract(const Duration(days: 11)),
        'Core 60',
        'core-60',
        'Lifestyle',
        'Men',
        'A stripped-back essential inspired by archival court shoes.',
        145,
        175,
        17,
        'Cream,Green',
        '7,8,9,10,11,12',
        48,
        false,
        true,
        true,
        'photo-1543508282-6319a3e2621f',
        'photo-1549298916-b41d501d3772',
      ),
    ];

    for (final product in seed) {
      final existing = await Product.db.findFirstRow(
        session,
        where: (t) => t.slug.equals(product.slug),
      );
      if (existing == null) await Product.db.insertRow(session, product);
    }
    await _seedVariants(session);
    return Product.db.count(session);
  }

  Future<void> _seedVariants(Session session) async {
    final products = await Product.db.find(session);
    for (final product in products) {
      if (await ProductVariant.db.count(
            session,
            where: (t) => t.productId.equals(product.id!),
          ) >
          0) {
        continue;
      }
      for (final color in product.colors.split(',')) {
        for (final size in product.sizes.split(',')) {
          await ProductVariant.db.insertRow(
            session,
            ProductVariant(
              productId: product.id!,
              color: color,
              size: size,
              sku: '${product.slug}-${color.toLowerCase()}-$size',
              stock: size == '10' ? 2 : 8,
              imageUrl: product.imageUrl,
            ),
          );
        }
      }
    }
  }

  Product _product(
    DateTime createdAt,
    String name,
    String slug,
    String category,
    String gender,
    String description,
    double price,
    double originalPrice,
    int discount,
    String colors,
    String sizes,
    int stock,
    bool featured,
    bool bestSeller,
    bool newArrival,
    String imageId,
    String secondaryImageId,
  ) => Product(
    name: name,
    slug: slug,
    brand: 'SOLEVA',
    category: category,
    gender: gender,
    description: description,
    imageUrl:
        'https://images.unsplash.com/$imageId?auto=format&fit=crop&w=1200&q=88',
    secondaryImageUrl:
        'https://images.unsplash.com/$secondaryImageId?auto=format&fit=crop&w=1200&q=88',
    price: price,
    originalPrice: originalPrice == price ? null : originalPrice,
    discount: discount,
    rating: 4.6 + (stock % 4) / 10,
    reviewCount: 40 + stock,
    colors: colors,
    sizes: sizes,
    stock: stock,
    featured: featured,
    bestSeller: bestSeller,
    trending: bestSeller,
    newArrival: newArrival,
    published: true,
    createdAt: createdAt,
  );
}
