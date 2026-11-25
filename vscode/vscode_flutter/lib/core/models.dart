import 'package:vscode_client/vscode_client.dart';

class UiProduct {
  final String name;
  final String slug;
  final String brand;
  final String category;
  final String gender;
  final String description;
  final String imageUrl;
  final String secondaryImageUrl;
  final double price;
  final double? originalPrice;
  final int discount;
  final double rating;
  final int reviewCount;
  final List<String> colors;
  final List<String> sizes;
  final int stock;
  final bool featured;
  final bool newArrival;
  final bool bestSeller;

  const UiProduct({
    required this.name,
    required this.slug,
    required this.brand,
    required this.category,
    required this.gender,
    required this.description,
    required this.imageUrl,
    required this.secondaryImageUrl,
    required this.price,
    this.originalPrice,
    this.discount = 0,
    required this.rating,
    required this.reviewCount,
    required this.colors,
    required this.sizes,
    required this.stock,
    required this.featured,
    required this.newArrival,
    this.bestSeller = false,
  });

  factory UiProduct.fromServer(Product p) => UiProduct(
    name: p.name,
    slug: p.slug,
    brand: p.brand,
    category: p.category,
    gender: p.gender,
    description: p.description,
    imageUrl: p.imageUrl,
    secondaryImageUrl: p.secondaryImageUrl,
    price: p.price,
    originalPrice: p.originalPrice,
    discount: p.discount,
    rating: p.rating,
    reviewCount: p.reviewCount,
    colors: p.colors.split(','),
    sizes: p.sizes.split(','),
    stock: p.stock,
    featured: p.featured,
    newArrival: p.newArrival,
    bestSeller: p.bestSeller,
  );
}
