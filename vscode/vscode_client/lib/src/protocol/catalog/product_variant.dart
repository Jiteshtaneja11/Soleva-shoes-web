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

abstract class ProductVariant
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  ProductVariant._({
    this.id,
    required this.productId,
    required this.color,
    required this.size,
    required this.sku,
    required this.stock,
    required this.imageUrl,
  });

  factory ProductVariant({
    int? id,
    required int productId,
    required String color,
    required String size,
    required String sku,
    required int stock,
    required String imageUrl,
  }) = _ProductVariantImpl;

  factory ProductVariant.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProductVariant(
      id: jsonSerialization['id'] as int?,
      productId: jsonSerialization['productId'] as int,
      color: jsonSerialization['color'] as String,
      size: jsonSerialization['size'] as String,
      sku: jsonSerialization['sku'] as String,
      stock: jsonSerialization['stock'] as int,
      imageUrl: jsonSerialization['imageUrl'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int productId;

  String color;

  String size;

  String sku;

  int stock;

  String imageUrl;

  /// Returns a shallow copy of this [ProductVariant]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  ProductVariant copyWith({
    int? id,
    int? productId,
    String? color,
    String? size,
    String? sku,
    int? stock,
    String? imageUrl,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'ProductVariant',
      if (id != null) 'id': id,
      'productId': productId,
      'color': color,
      'size': size,
      'sku': sku,
      'stock': stock,
      'imageUrl': imageUrl,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'ProductVariant',
      if (id != null) 'id': id,
      'productId': productId,
      'color': color,
      'size': size,
      'sku': sku,
      'stock': stock,
      'imageUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ProductVariantImpl extends ProductVariant {
  _ProductVariantImpl({
    int? id,
    required int productId,
    required String color,
    required String size,
    required String sku,
    required int stock,
    required String imageUrl,
  }) : super._(
         id: id,
         productId: productId,
         color: color,
         size: size,
         sku: sku,
         stock: stock,
         imageUrl: imageUrl,
       );

  /// Returns a shallow copy of this [ProductVariant]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  ProductVariant copyWith({
    Object? id = _Undefined,
    int? productId,
    String? color,
    String? size,
    String? sku,
    int? stock,
    String? imageUrl,
  }) {
    return ProductVariant(
      id: id is int? ? id : this.id,
      productId: productId ?? this.productId,
      color: color ?? this.color,
      size: size ?? this.size,
      sku: sku ?? this.sku,
      stock: stock ?? this.stock,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
