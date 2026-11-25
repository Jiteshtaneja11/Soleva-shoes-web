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

abstract class ProductVariant
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
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

  static final t = ProductVariantTable();

  static const db = ProductVariantRepository._();

  @override
  int? id;

  int productId;

  String color;

  String size;

  String sku;

  int stock;

  String imageUrl;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [ProductVariant]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
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

  static ProductVariantInclude include() {
    return ProductVariantInclude._();
  }

  static ProductVariantIncludeList includeList({
    _is.WhereExpressionBuilder<ProductVariantTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductVariantTable>? orderBy,
    _is.OrderByListBuilder<ProductVariantTable>? orderByList,
    ProductVariantInclude? include,
  }) {
    return ProductVariantIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductVariant.t),
      orderByList: orderByList?.call(ProductVariant.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
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
  @_is.useResult
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

class ProductVariantUpdateTable extends _is.UpdateTable<ProductVariantTable> {
  ProductVariantUpdateTable(super.table);

  _is.ColumnValue<int, int> productId(int value) => _is.ColumnValue(
    table.productId,
    value,
  );

  _is.ColumnValue<String, String> color(String value) => _is.ColumnValue(
    table.color,
    value,
  );

  _is.ColumnValue<String, String> size(String value) => _is.ColumnValue(
    table.size,
    value,
  );

  _is.ColumnValue<String, String> sku(String value) => _is.ColumnValue(
    table.sku,
    value,
  );

  _is.ColumnValue<int, int> stock(int value) => _is.ColumnValue(
    table.stock,
    value,
  );

  _is.ColumnValue<String, String> imageUrl(String value) => _is.ColumnValue(
    table.imageUrl,
    value,
  );
}

class ProductVariantTable extends _is.Table<int?> {
  ProductVariantTable({super.tableRelation})
    : super(tableName: 'product_variant') {
    updateTable = ProductVariantUpdateTable(this);
    productId = _is.ColumnInt(
      'productId',
      this,
    );
    color = _is.ColumnString(
      'color',
      this,
    );
    size = _is.ColumnString(
      'size',
      this,
    );
    sku = _is.ColumnString(
      'sku',
      this,
    );
    stock = _is.ColumnInt(
      'stock',
      this,
    );
    imageUrl = _is.ColumnString(
      'imageUrl',
      this,
    );
  }

  late final ProductVariantUpdateTable updateTable;

  late final _is.ColumnInt productId;

  late final _is.ColumnString color;

  late final _is.ColumnString size;

  late final _is.ColumnString sku;

  late final _is.ColumnInt stock;

  late final _is.ColumnString imageUrl;

  @override
  List<_is.Column> get columns => [
    id,
    productId,
    color,
    size,
    sku,
    stock,
    imageUrl,
  ];
}

class ProductVariantInclude extends _is.IncludeObject {
  ProductVariantInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => ProductVariant.t;
}

class ProductVariantIncludeList extends _is.IncludeList {
  ProductVariantIncludeList._({
    _is.WhereExpressionBuilder<ProductVariantTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ProductVariant.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => ProductVariant.t;
}

class ProductVariantRepository {
  const ProductVariantRepository._();

  /// Returns a list of [ProductVariant]s matching the given query parameters.
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
  Future<List<ProductVariant>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductVariantTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductVariantTable>? orderBy,
    _is.OrderByListBuilder<ProductVariantTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<ProductVariant>(
      where: where?.call(ProductVariant.t),
      orderBy: orderBy?.call(ProductVariant.t),
      orderByList: orderByList?.call(ProductVariant.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [ProductVariant]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `ProductVariant.t`.
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
  _ida.Stream<List<ProductVariant>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductVariantTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductVariantTable>? orderBy,
    _is.OrderByListBuilder<ProductVariantTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<ProductVariant>(
      where: where?.call(ProductVariant.t),
      orderBy: orderBy?.call(ProductVariant.t),
      orderByList: orderByList?.call(ProductVariant.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [ProductVariant] matching the given query parameters.
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
  Future<ProductVariant?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductVariantTable>? where,
    int? offset,
    _is.OrderByBuilder<ProductVariantTable>? orderBy,
    _is.OrderByListBuilder<ProductVariantTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<ProductVariant>(
      where: where?.call(ProductVariant.t),
      orderBy: orderBy?.call(ProductVariant.t),
      orderByList: orderByList?.call(ProductVariant.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [ProductVariant] by its [id] or null if no such row exists.
  Future<ProductVariant?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<ProductVariant>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [ProductVariant]s in the list and returns the inserted rows.
  ///
  /// The returned [ProductVariant]s will have their `id` fields set.
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
  Future<List<ProductVariant>> insert(
    _is.DatabaseSession session,
    List<ProductVariant> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<ProductVariant>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [ProductVariant] and returns the inserted row.
  ///
  /// The returned [ProductVariant] will have its `id` field set.
  Future<ProductVariant> insertRow(
    _is.DatabaseSession session,
    ProductVariant row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<ProductVariant>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [ProductVariant]s in the list and returns the resulting rows.
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
  /// The returned [ProductVariant]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ProductVariant>> upsert(
    _is.DatabaseSession session,
    List<ProductVariant> rows, {
    required _is.ColumnSelections<ProductVariantTable> conflictColumns,
    _is.ColumnSelections<ProductVariantTable>? updateColumns,
    _is.WhereExpressionBuilder<ProductVariantTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<ProductVariant>(
      rows,
      conflictColumns: conflictColumns(ProductVariant.t),
      updateColumns: updateColumns?.call(ProductVariant.t),
      updateWhere: updateWhere?.call(ProductVariant.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [ProductVariant] and returns the resulting row.
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
  /// The returned [ProductVariant] will have its `id` field set.
  Future<ProductVariant?> upsertRow(
    _is.DatabaseSession session,
    ProductVariant row, {
    required _is.ColumnSelections<ProductVariantTable> conflictColumns,
    _is.ColumnSelections<ProductVariantTable>? updateColumns,
    _is.WhereExpressionBuilder<ProductVariantTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<ProductVariant>(
      row,
      conflictColumns: conflictColumns(ProductVariant.t),
      updateColumns: updateColumns?.call(ProductVariant.t),
      updateWhere: updateWhere?.call(ProductVariant.t),
      transaction: transaction,
    );
  }

  /// Updates all [ProductVariant]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ProductVariant>> update(
    _is.DatabaseSession session,
    List<ProductVariant> rows, {
    _is.ColumnSelections<ProductVariantTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<ProductVariant>(
      rows,
      columns: columns?.call(ProductVariant.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [ProductVariant]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ProductVariant> updateRow(
    _is.DatabaseSession session,
    ProductVariant row, {
    _is.ColumnSelections<ProductVariantTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<ProductVariant>(
      row,
      columns: columns?.call(ProductVariant.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ProductVariant] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<ProductVariant?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<ProductVariantUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<ProductVariant>(
      id,
      columnValues: columnValues(ProductVariant.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [ProductVariant]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<ProductVariant>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<ProductVariantUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<ProductVariantTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<ProductVariantTable>? orderBy,
    _is.OrderByListBuilder<ProductVariantTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<ProductVariant>(
      columnValues: columnValues(ProductVariant.t.updateTable),
      where: where(ProductVariant.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ProductVariant.t),
      orderByList: orderByList?.call(ProductVariant.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [ProductVariant]s in the list and returns the deleted rows.
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
  Future<List<ProductVariant>> delete(
    _is.DatabaseSession session,
    List<ProductVariant> rows, {
    _is.OrderByBuilder<ProductVariantTable>? orderBy,
    _is.OrderByListBuilder<ProductVariantTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<ProductVariant>(
      rows,
      orderBy: orderBy?.call(ProductVariant.t),
      orderByList: orderByList?.call(ProductVariant.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [ProductVariant].
  Future<ProductVariant> deleteRow(
    _is.DatabaseSession session,
    ProductVariant row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ProductVariant>(
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
  Future<List<ProductVariant>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ProductVariantTable> where,
    _is.OrderByBuilder<ProductVariantTable>? orderBy,
    _is.OrderByListBuilder<ProductVariantTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<ProductVariant>(
      where: where(ProductVariant.t),
      orderBy: orderBy?.call(ProductVariant.t),
      orderByList: orderByList?.call(ProductVariant.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<ProductVariantTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<ProductVariant>(
      where: where?.call(ProductVariant.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [ProductVariant] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<ProductVariantTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<ProductVariant>(
      where: where(ProductVariant.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
