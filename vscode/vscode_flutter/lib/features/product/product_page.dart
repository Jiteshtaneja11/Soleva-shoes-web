import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/app_scope.dart';
import '../../core/models.dart';
import '../../theme/soleva_theme.dart';
import '../../widgets/soleva_scaffold.dart';

class ProductPage extends StatefulWidget {
  final String slug;
  const ProductPage({super.key, required this.slug});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? size;

  @override
  Widget build(BuildContext context) {
    final app = AppScope.of(context);
    UiProduct? product;
    for (final p in app.products) {
      if (p.slug == widget.slug) product = p;
    }
    if (product == null) {
      return SolevaScaffold(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Product unavailable',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/shop'),
                child: const Text('RETURN TO SHOP'),
              ),
            ],
          ),
        ),
      );
    }

    final wide = MediaQuery.sizeOf(context).width >= 900;
    final wished = app.wishlist.contains(product.slug);
    return SolevaScaffold(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(wide ? 44 : 18),
            child: wide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _Gallery(product: product)),
                      const SizedBox(width: 44),
                      Expanded(
                        child: _Details(
                          product: product,
                          size: size,
                          onSize: (v) => setState(() => size = v),
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      _Gallery(product: product),
                      const SizedBox(height: 28),
                      _Details(
                        product: product,
                        size: size,
                        onSize: (v) => setState(() => size = v),
                      ),
                    ],
                  ),
          ),
          Container(
            color: SolevaTheme.ink,
            padding: EdgeInsets.all(wide ? 44 : 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ENGINEERED FOR\nEVERYDAY MOTION.',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 18),
                Text(
                  product.description,
                  style: const TextStyle(color: Color(0xFFBBBBB5), height: 1.7),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(44),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => app.toggleWishlist(product!),
                    child: Text(wished ? 'REMOVE WISHLIST' : 'ADD WISHLIST'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      await Clipboard.setData(
                        ClipboardData(text: 'SOLEVA ${product!.name}'),
                      );
                      if (context.mounted)
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Product link copied')),
                        );
                    },
                    child: const Text('SHARE'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Gallery extends StatefulWidget {
  final UiProduct product;
  const _Gallery({required this.product});

  @override
  State<_Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<_Gallery> {
  late String selectedUrl;

  @override
  void initState() {
    super.initState();
    selectedUrl = widget.product.imageUrl;
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      AspectRatio(
        aspectRatio: 1,
        child: Container(
          color: const Color(0xFFE6E2D8),
          child: InteractiveViewer(
            minScale: 1,
            maxScale: 3,
            child: Image.network(
              selectedUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(
                Icons.image_not_supported_outlined,
                size: 80,
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 12),
      Row(
        children: [
          for (final url in {
            widget.product.imageUrl,
            widget.product.secondaryImageUrl,
          })
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: InkWell(
                  onTap: () => setState(() => selectedUrl = url),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const ColoredBox(
                        color: Color(0xFFE6E2D8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    ],
  );
}

class _Details extends StatelessWidget {
  final UiProduct product;
  final String? size;
  final ValueChanged<String> onSize;
  const _Details({
    required this.product,
    required this.size,
    required this.onSize,
  });

  @override
  Widget build(BuildContext context) {
    final app = AppScope.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.brand,
          style: const TextStyle(
            letterSpacing: 2,
            fontWeight: FontWeight.w800,
            color: SolevaTheme.muted,
          ),
        ),
        const SizedBox(height: 8),
        Text(product.name, style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              '\$${product.price.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            if (product.originalPrice != null) ...[
              const SizedBox(width: 10),
              Text(
                '\$${product.originalPrice!.toStringAsFixed(0)}',
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: SolevaTheme.muted,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 16),
        Text('${product.rating} ★  ·  ${product.reviewCount} reviews'),
        const SizedBox(height: 24),
        Text(product.description, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 28),
        const Text(
          'SELECT SIZE',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: product.sizes
              .map(
                (v) => ChoiceChip(
                  label: Text(v),
                  selected: size == v,
                  onSelected: (_) => onSize(v),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 12),
        Text(
          product.stock > 0
              ? 'IN STOCK · ${product.stock} AVAILABLE'
              : 'OUT OF STOCK',
          style: TextStyle(
            color: product.stock > 0 ? const Color(0xFF418E41) : Colors.red,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: product.stock > 0
                ? () {
                    if (size == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Select a size')),
                      );
                      return;
                    }
                    app.addToCart(product, size: size);
                    Navigator.pushNamed(context, '/cart');
                  }
                : null,
            child: const Text('ADD TO BAG'),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: product.stock > 0
                ? () {
                    if (size == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Select a size')),
                      );
                      return;
                    }
                    app.addToCart(product, size: size);
                    Navigator.pushNamed(context, '/cart');
                  }
                : null,
            child: const Text('BUY NOW'),
          ),
        ),
      ],
    );
  }
}
