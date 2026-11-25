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
import 'dart:async' as _ida;
import 'package:serverpod/serverpod.dart' as _is;

abstract class Product
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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
      featured: _is.BoolJsonExtension.fromJson(jsonSerialization['featured']),
      bestSeller: _is.BoolJsonExtension.fromJson(
        jsonSerialization['bestSeller'],
      ),
      trending: _is.BoolJsonExtension.fromJson(jsonSerialization['trending']),
      newArrival: _is.BoolJsonExtension.fromJson(
        jsonSerialization['newArrival'],
      ),
      published: _is.BoolJsonExtension.fromJson(jsonSerialization['published']),
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  static final t = ProductTable();

  static const db = ProductRepository._();

  @override
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

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [Product]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static ProductInclude include() {
    return ProductInclude._();
  }

  static ProductIncludeList includeList({
    _is.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductTable>? orderBy,
    _is.OrderByListBuilder<ProductTable>? orderByList,
    ProductInclude? include,
  }) {
    return ProductIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class ProductUpdateTable extends _is.UpdateTable<ProductTable> {
  ProductUpdateTable(super.table);

  _is.ColumnValue<String, String> name(String value) => _is.ColumnValue(
    table.name,
    value,
  );

  _is.ColumnValue<String, String> slug(String value) => _is.ColumnValue(
    table.slug,
    value,
  );

  _is.ColumnValue<String, String> brand(String value) => _is.ColumnValue(
    table.brand,
    value,
  );

  _is.ColumnValue<String, String> category(String value) => _is.ColumnValue(
    table.category,
    value,
  );

  _is.ColumnValue<String, String> gender(String value) => _is.ColumnValue(
    table.gender,
    value,
  );

  _is.ColumnValue<String, String> description(String value) => _is.ColumnValue(
    table.description,
    value,
  );

  _is.ColumnValue<String, String> imageUrl(String value) => _is.ColumnValue(
    table.imageUrl,
    value,
  );

  _is.ColumnValue<String, String> secondaryImageUrl(String value) =>
      _is.ColumnValue(
        table.secondaryImageUrl,
        value,
      );

  _is.ColumnValue<double, double> price(double value) => _is.ColumnValue(
    table.price,
    value,
  );

  _is.ColumnValue<double, double> originalPrice(double? value) =>
      _is.ColumnValue(
        table.originalPrice,
        value,
      );

  _is.ColumnValue<int, int> discount(int value) => _is.ColumnValue(
    table.discount,
    value,
  );

  _is.ColumnValue<double, double> rating(double value) => _is.ColumnValue(
    table.rating,
    value,
  );

  _is.ColumnValue<int, int> reviewCount(int value) => _is.ColumnValue(
    table.reviewCount,
    value,
  );

  _is.ColumnValue<String, String> colors(String value) => _is.ColumnValue(
    table.colors,
    value,
  );

  _is.ColumnValue<String, String> sizes(String value) => _is.ColumnValue(
    table.sizes,
    value,
  );

  _is.ColumnValue<int, int> stock(int value) => _is.ColumnValue(
    table.stock,
    value,
  );

  _is.ColumnValue<bool, bool> featured(bool value) => _is.ColumnValue(
    table.featured,
    value,
  );

  _is.ColumnValue<bool, bool> bestSeller(bool value) => _is.ColumnValue(
    table.bestSeller,
    value,
  );

  _is.ColumnValue<bool, bool> trending(bool value) => _is.ColumnValue(
    table.trending,
    value,
  );

  _is.ColumnValue<bool, bool> newArrival(bool value) => _is.ColumnValue(
    table.newArrival,
    value,
  );

  _is.ColumnValue<bool, bool> published(bool value) => _is.ColumnValue(
    table.published,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );
}

class ProductTable extends _is.Table<int?> {
  ProductTable({super.tableRelation}) : super(tableName: 'product') {
    updateTable = ProductUpdateTable(this);
    name = _is.ColumnString(
      'name',
      this,
    );
    slug = _is.ColumnString(
      'slug',
      this,
    );
    brand = _is.ColumnString(
      'brand',
      this,
    );
    category = _is.ColumnString(
      'category',
      this,
    );
    gender = _is.ColumnString(
      'gender',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    imageUrl = _is.ColumnString(
      'imageUrl',
      this,
    );
    secondaryImageUrl = _is.ColumnString(
      'secondaryImageUrl',
      this,
    );
    price = _is.ColumnDouble(
      'price',
      this,
    );
    originalPrice = _is.ColumnDouble(
      'originalPrice',
      this,
    );
    discount = _is.ColumnInt(
      'discount',
      this,
    );
    rating = _is.ColumnDouble(
      'rating',
      this,
    );
    reviewCount = _is.ColumnInt(
      'reviewCount',
      this,
    );
    colors = _is.ColumnString(
      'colors',
      this,
    );
    sizes = _is.ColumnString(
      'sizes',
      this,
    );
    stock = _is.ColumnInt(
      'stock',
      this,
    );
    featured = _is.ColumnBool(
      'featured',
      this,
    );
    bestSeller = _is.ColumnBool(
      'bestSeller',
      this,
    );
    trending = _is.ColumnBool(
      'trending',
      this,
    );
    newArrival = _is.ColumnBool(
      'newArrival',
      this,
    );
    published = _is.ColumnBool(
      'published',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
  }

  late final ProductUpdateTable updateTable;

  late final _is.ColumnString name;

  late final _is.ColumnString slug;

  late final _is.ColumnString brand;

  late final _is.ColumnString category;

  late final _is.ColumnString gender;

  late final _is.ColumnString description;

  late final _is.ColumnString imageUrl;

  late final _is.ColumnString secondaryImageUrl;

  late final _is.ColumnDouble price;

  late final _is.ColumnDouble originalPrice;

  late final _is.ColumnInt discount;

  late final _is.ColumnDouble rating;

  late final _is.ColumnInt reviewCount;

  late final _is.ColumnString colors;

  late final _is.ColumnString sizes;

  late final _is.ColumnInt stock;

  late final _is.ColumnBool featured;

  late final _is.ColumnBool bestSeller;

  late final _is.ColumnBool trending;

  late final _is.ColumnBool newArrival;

  late final _is.ColumnBool published;

  late final _is.ColumnDateTime createdAt;

  @override
  List<_is.Column> get columns => [
    id,
    name,
    slug,
    brand,
    category,
    gender,
    description,
    imageUrl,
    secondaryImageUrl,
    price,
    originalPrice,
    discount,
    rating,
    reviewCount,
    colors,
    sizes,
    stock,
    featured,
    bestSeller,
    trending,
    newArrival,
    published,
    createdAt,
  ];
}

class ProductInclude extends _is.IncludeObject {
  ProductInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => Product.t;
}

class ProductIncludeList extends _is.IncludeList {
  ProductIncludeList._({
    _is.WhereExpressionBuilder<ProductTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Product.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => Product.t;
}

class ProductRepository {
  const ProductRepository._();

  /// Returns a list of [Product]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<Product>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductTable>? orderBy,
    _is.OrderByListBuilder<ProductTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [Product]s matching the given query parameters every time the
  /// source tables are modified.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// Use [throttle] to specify the minimum interval between queries. It can
  /// also be set to `null`, in which case the stream will only be throttled
  /// when its subscription is paused.
  ///
  /// Source tables are collected from the queried table, [where], [orderBy],
  /// [orderByList], and the [include] graph. [alsoTriggerOnTables] is added
  /// to that set. Pass [Table] instances such as `Product.t`.
  ///
  /// Raw [Expression] SQL is not inspected. Tables referenced only in raw
  /// SQL must be passed via [alsoTriggerOnTables].
  ///
  /// The stream always reads committed state and never joins an ambient
  /// [Transaction]. Emissions for a write fire after that write commits.
  ///
  /// Currently only supported on SQLite. Calling this method on PostgreSQL
  /// throws an [UnsupportedError].
  ///
  /// ```dart
  /// var subscription = Persons.db.watch(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// ).listen((persons) {
  ///   // Handle the latest matching rows.
  /// });
  /// ```
  _ida.Stream<List<Product>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductTable>? orderBy,
    _is.OrderByListBuilder<ProductTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [Product] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<Product?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductTable>? where,
    int? offset,
    _is.OrderByBuilder<ProductTable>? orderBy,
    _is.OrderByListBuilder<ProductTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<Product>(
      where: where?.call(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [Product] by its [id] or null if no such row exists.
  Future<Product?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<Product>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [Product]s in the list and returns the inserted rows.
  ///
  /// The returned [Product]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Product>> insert(
    _is.DatabaseSession session,
    List<Product> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<Product>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [Product] and returns the inserted row.
  ///
  /// The returned [Product] will have its `id` field set.
  Future<Product> insertRow(
    _is.DatabaseSession session,
    Product row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<Product>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [Product]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [Product]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Product>> upsert(
    _is.DatabaseSession session,
    List<Product> rows, {
    required _is.ColumnSelections<ProductTable> conflictColumns,
    _is.ColumnSelections<ProductTable>? updateColumns,
    _is.WhereExpressionBuilder<ProductTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<Product>(
      rows,
      conflictColumns: conflictColumns(Product.t),
      updateColumns: updateColumns?.call(Product.t),
      updateWhere: updateWhere?.call(Product.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [Product] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [Product] will have its `id` field set.
  Future<Product?> upsertRow(
    _is.DatabaseSession session,
    Product row, {
    required _is.ColumnSelections<ProductTable> conflictColumns,
    _is.ColumnSelections<ProductTable>? updateColumns,
    _is.WhereExpressionBuilder<ProductTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<Product>(
      row,
      conflictColumns: conflictColumns(Product.t),
      updateColumns: updateColumns?.call(Product.t),
      updateWhere: updateWhere?.call(Product.t),
      transaction: transaction,
    );
  }

  /// Updates all [Product]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Product>> update(
    _is.DatabaseSession session,
    List<Product> rows, {
    _is.ColumnSelections<ProductTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<Product>(
      rows,
      columns: columns?.call(Product.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [Product]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Product> updateRow(
    _is.DatabaseSession session,
    Product row, {
    _is.ColumnSelections<ProductTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<Product>(
      row,
      columns: columns?.call(Product.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Product] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<Product?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ProductUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<Product>(
      id,
      columnValues: columnValues(Product.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [Product]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Product>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ProductUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<ProductTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductTable>? orderBy,
    _is.OrderByListBuilder<ProductTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<Product>(
      columnValues: columnValues(Product.t.updateTable),
      where: where(Product.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [Product]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Product>> delete(
    _is.DatabaseSession session,
    List<Product> rows, {
    _is.OrderByBuilder<ProductTable>? orderBy,
    _is.OrderByListBuilder<ProductTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<Product>(
      rows,
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [Product].
  Future<Product> deleteRow(
    _is.DatabaseSession session,
    Product row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Product>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<Product>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ProductTable> where,
    _is.OrderByBuilder<ProductTable>? orderBy,
    _is.OrderByListBuilder<ProductTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<Product>(
      where: where(Product.t),
      orderBy: orderBy?.call(Product.t),
      orderByList: orderByList?.call(Product.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<Product>(
      where: where?.call(Product.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [Product] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ProductTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<Product>(
      where: where(Product.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
