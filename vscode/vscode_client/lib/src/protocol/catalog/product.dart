/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class Product
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  Product._({
    this.id,
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
    required this.discount,
    required this.rating,
    required this.reviewCount,
    required this.colors,
    required this.sizes,
    required this.stock,
    required this.featured,
    required this.bestSeller,
    required this.trending,
    required this.newArrival,
    required this.published,
    required this.createdAt,
  });

  factory Product({
    int? id,
    required String name,
    required String slug,
    required String brand,
    required String category,
    required String gender,
    required String description,
    required String imageUrl,
    required String secondaryImageUrl,
    required double price,
    double? originalPrice,
    required int discount,
    required double rating,
    required int reviewCount,
    required String colors,
    required String sizes,
    required int stock,
    required bool featured,
    required bool bestSeller,
    required bool trending,
    required bool newArrival,
    required bool published,
    required DateTime createdAt,
  }) = _ProductImpl;

  factory Product.fromJson(Map<String, dynamic> jsonSerialization) {
    return Product(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      slug: jsonSerialization['slug'] as String,
      brand: jsonSerialization['brand'] as String,
      category: jsonSerialization['category'] as String,
      gender: jsonSerialization['gender'] as String,
      description: jsonSerialization['description'] as String,
      imageUrl: jsonSerialization['imageUrl'] as String,
      secondaryImageUrl: jsonSerialization['secondaryImageUrl'] as String,
      price: (jsonSerialization['price'] as num).toDouble(),
      originalPrice: (jsonSerialization['originalPrice'] as num?)?.toDouble(),
      discount: jsonSerialization['discount'] as int,
      rating: (jsonSerialization['rating'] as num).toDouble(),
      reviewCount: jsonSerialization['reviewCount'] as int,
      colors: jsonSerialization['colors'] as String,
      sizes: jsonSerialization['sizes'] as String,
      stock: jsonSerialization['stock'] as int,
      featured: _isc.BoolJsonExtension.fromJson(jsonSerialization['featured']),
      bestSeller: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['bestSeller'],
      ),
      trending: _isc.BoolJsonExtension.fromJson(jsonSerialization['trending']),
      newArrival: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['newArrival'],
      ),
      published: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['published'],
      ),
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String slug;

  String brand;

  String category;

  String gender;

  String description;

  String imageUrl;

  String secondaryImageUrl;

  double price;

  double? originalPrice;

  int discount;

  double rating;

  int reviewCount;

  String colors;

  String sizes;

  int stock;

  bool featured;

  bool bestSeller;

  bool trending;

  bool newArrival;

  bool published;

  DateTime createdAt;

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  Product copyWith({
    int? id,
    String? name,
    String? slug,
    String? brand,
    String? category,
    String? gender,
    String? description,
    String? imageUrl,
    String? secondaryImageUrl,
    double? price,
    double? originalPrice,
    int? discount,
    double? rating,
    int? reviewCount,
    String? colors,
    String? sizes,
    int? stock,
    bool? featured,
    bool? bestSeller,
    bool? trending,
    bool? newArrival,
    bool? published,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'Product',
      if (id != null) 'id': id,
      'name': name,
      'slug': slug,
      'brand': brand,
      'category': category,
      'gender': gender,
      'description': description,
      'imageUrl': imageUrl,
      'secondaryImageUrl': secondaryImageUrl,
      'price': price,
      if (originalPrice != null) 'originalPrice': originalPrice,
      'discount': discount,
      'rating': rating,
      'reviewCount': reviewCount,
      'colors': colors,
      'sizes': sizes,
      'stock': stock,
      'featured': featured,
      'bestSeller': bestSeller,
      'trending': trending,
      'newArrival': newArrival,
      'published': published,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'Product',
      if (id != null) 'id': id,
      'name': name,
      'slug': slug,
      'brand': brand,
      'category': category,
      'gender': gender,
      'description': description,
      'imageUrl': imageUrl,
      'secondaryImageUrl': secondaryImageUrl,
      'price': price,
      if (originalPrice != null) 'originalPrice': originalPrice,
      'discount': discount,
      'rating': rating,
      'reviewCount': reviewCount,
      'colors': colors,
      'sizes': sizes,
      'stock': stock,
      'featured': featured,
      'bestSeller': bestSeller,
      'trending': trending,
      'newArrival': newArrival,
      'published': published,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductImpl extends Product {
  _ProductImpl({
    int? id,
    required String name,
    required String slug,
    required String brand,
    required String category,
    required String gender,
    required String description,
    required String imageUrl,
    required String secondaryImageUrl,
    required double price,
    double? originalPrice,
    required int discount,
    required double rating,
    required int reviewCount,
    required String colors,
    required String sizes,
    required int stock,
    required bool featured,
    required bool bestSeller,
    required bool trending,
    required bool newArrival,
    required bool published,
    required DateTime createdAt,
  }) : super._(
         id: id,
         name: name,
         slug: slug,
         brand: brand,
         category: category,
         gender: gender,
         description: description,
         imageUrl: imageUrl,
         secondaryImageUrl: secondaryImageUrl,
         price: price,
         originalPrice: originalPrice,
         discount: discount,
         rating: rating,
         reviewCount: reviewCount,
         colors: colors,
         sizes: sizes,
         stock: stock,
         featured: featured,
         bestSeller: bestSeller,
         trending: trending,
         newArrival: newArrival,
         published: published,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  Product copyWith({
    Object? id = _Undefined,
    String? name,
    String? slug,
    String? brand,
    String? category,
    String? gender,
    String? description,
    String? imageUrl,
    String? secondaryImageUrl,
    double? price,
    Object? originalPrice = _Undefined,
    int? discount,
    double? rating,
    int? reviewCount,
    String? colors,
    String? sizes,
    int? stock,
    bool? featured,
    bool? bestSeller,
    bool? trending,
    bool? newArrival,
    bool? published,
    DateTime? createdAt,
  }) {
    return Product(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      gender: gender ?? this.gender,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      secondaryImageUrl: secondaryImageUrl ?? this.secondaryImageUrl,
      price: price ?? this.price,
      originalPrice: originalPrice is double?
          ? originalPrice
          : this.originalPrice,
      discount: discount ?? this.discount,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      colors: colors ?? this.colors,
      sizes: sizes ?? this.sizes,
      stock: stock ?? this.stock,
      featured: featured ?? this.featured,
      bestSeller: bestSeller ?? this.bestSeller,
      trending: trending ?? this.trending,
      newArrival: newArrival ?? this.newArrival,
      published: published ?? this.published,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
