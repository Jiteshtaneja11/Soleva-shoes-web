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

abstract class NewsletterSubscriber
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  NewsletterSubscriber._({
    this.id,
    required this.email,
    required this.subscribedAt,
  });

  factory NewsletterSubscriber({
    int? id,
    required String email,
    required DateTime subscribedAt,
  }) = _NewsletterSubscriberImpl;

  factory NewsletterSubscriber.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return NewsletterSubscriber(
      id: jsonSerialization['id'] as int?,
      email: jsonSerialization['email'] as String,
      subscribedAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['subscribedAt'],
      ),
    );
  }

  static final t = NewsletterSubscriberTable();

  static const db = NewsletterSubscriberRepository._();

  @override
  int? id;

  String email;

  DateTime subscribedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [NewsletterSubscriber]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  NewsletterSubscriber copyWith({
    int? id,
    String? email,
    DateTime? subscribedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'NewsletterSubscriber',
      if (id != null) 'id': id,
      'email': email,
      'subscribedAt': subscribedAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'NewsletterSubscriber',
      if (id != null) 'id': id,
      'email': email,
      'subscribedAt': subscribedAt.toJson(),
    };
  }

  static NewsletterSubscriberInclude include() {
    return NewsletterSubscriberInclude._();
  }

  static NewsletterSubscriberIncludeList includeList({
    _is.WhereExpressionBuilder<NewsletterSubscriberTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<NewsletterSubscriberTable>? orderBy,
    _is.OrderByListBuilder<NewsletterSubscriberTable>? orderByList,
    NewsletterSubscriberInclude? include,
  }) {
    return NewsletterSubscriberIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NewsletterSubscriber.t),
      orderByList: orderByList?.call(NewsletterSubscriber.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _NewsletterSubscriberImpl extends NewsletterSubscriber {
  _NewsletterSubscriberImpl({
    int? id,
    required String email,
    required DateTime subscribedAt,
  }) : super._(
         id: id,
         email: email,
         subscribedAt: subscribedAt,
       );

  /// Returns a shallow copy of this [NewsletterSubscriber]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  NewsletterSubscriber copyWith({
    Object? id = _Undefined,
    String? email,
    DateTime? subscribedAt,
  }) {
    return NewsletterSubscriber(
      id: id is int? ? id : this.id,
      email: email ?? this.email,
      subscribedAt: subscribedAt ?? this.subscribedAt,
    );
  }
}

class NewsletterSubscriberUpdateTable
    extends _is.UpdateTable<NewsletterSubscriberTable> {
  NewsletterSubscriberUpdateTable(super.table);

  _is.ColumnValue<String, String> email(String value) => _is.ColumnValue(
    table.email,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> subscribedAt(DateTime value) =>
      _is.ColumnValue(
        table.subscribedAt,
        value,
      );
}

class NewsletterSubscriberTable extends _is.Table<int?> {
  NewsletterSubscriberTable({super.tableRelation})
    : super(tableName: 'newsletter_subscriber') {
    updateTable = NewsletterSubscriberUpdateTable(this);
    email = _is.ColumnString(
      'email',
      this,
    );
    subscribedAt = _is.ColumnDateTime(
      'subscribedAt',
      this,
    );
  }

  late final NewsletterSubscriberUpdateTable updateTable;

  late final _is.ColumnString email;

  late final _is.ColumnDateTime subscribedAt;

  @override
  List<_is.Column> get columns => [
    id,
    email,
    subscribedAt,
  ];
}

class NewsletterSubscriberInclude extends _is.IncludeObject {
  NewsletterSubscriberInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => NewsletterSubscriber.t;
}

class NewsletterSubscriberIncludeList extends _is.IncludeList {
  NewsletterSubscriberIncludeList._({
    _is.WhereExpressionBuilder<NewsletterSubscriberTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(NewsletterSubscriber.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => NewsletterSubscriber.t;
}

class NewsletterSubscriberRepository {
  const NewsletterSubscriberRepository._();

  /// Returns a list of [NewsletterSubscriber]s matching the given query parameters.
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
  Future<List<NewsletterSubscriber>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<NewsletterSubscriberTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<NewsletterSubscriberTable>? orderBy,
    _is.OrderByListBuilder<NewsletterSubscriberTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<NewsletterSubscriber>(
      where: where?.call(NewsletterSubscriber.t),
      orderBy: orderBy?.call(NewsletterSubscriber.t),
      orderByList: orderByList?.call(NewsletterSubscriber.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Emits [NewsletterSubscriber]s matching the given query parameters every time the
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
  /// to that set. Pass [Table] instances such as `NewsletterSubscriber.t`.
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
  _ida.Stream<List<NewsletterSubscriber>> watch(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<NewsletterSubscriberTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<NewsletterSubscriberTable>? orderBy,
    _is.OrderByListBuilder<NewsletterSubscriberTable>? orderByList,
    Duration? throttle = const Duration(milliseconds: 30),
    Iterable<_is.Table>? alsoTriggerOnTables,
  }) {
    return session.db.watch<NewsletterSubscriber>(
      where: where?.call(NewsletterSubscriber.t),
      orderBy: orderBy?.call(NewsletterSubscriber.t),
      orderByList: orderByList?.call(NewsletterSubscriber.t),
      limit: limit,
      offset: offset,
      throttle: throttle,
      alsoTriggerOnTables: alsoTriggerOnTables,
    );
  }

  /// Returns the first matching [NewsletterSubscriber] matching the given query parameters.
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
  Future<NewsletterSubscriber?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<NewsletterSubscriberTable>? where,
    int? offset,
    _is.OrderByBuilder<NewsletterSubscriberTable>? orderBy,
    _is.OrderByListBuilder<NewsletterSubscriberTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<NewsletterSubscriber>(
      where: where?.call(NewsletterSubscriber.t),
      orderBy: orderBy?.call(NewsletterSubscriber.t),
      orderByList: orderByList?.call(NewsletterSubscriber.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [NewsletterSubscriber] by its [id] or null if no such row exists.
  Future<NewsletterSubscriber?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<NewsletterSubscriber>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [NewsletterSubscriber]s in the list and returns the inserted rows.
  ///
  /// The returned [NewsletterSubscriber]s will have their `id` fields set.
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
  Future<List<NewsletterSubscriber>> insert(
    _is.DatabaseSession session,
    List<NewsletterSubscriber> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<NewsletterSubscriber>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [NewsletterSubscriber] and returns the inserted row.
  ///
  /// The returned [NewsletterSubscriber] will have its `id` field set.
  Future<NewsletterSubscriber> insertRow(
    _is.DatabaseSession session,
    NewsletterSubscriber row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<NewsletterSubscriber>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [NewsletterSubscriber]s in the list and returns the resulting rows.
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
  /// The returned [NewsletterSubscriber]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<NewsletterSubscriber>> upsert(
    _is.DatabaseSession session,
    List<NewsletterSubscriber> rows, {
    required _is.ColumnSelections<NewsletterSubscriberTable> conflictColumns,
    _is.ColumnSelections<NewsletterSubscriberTable>? updateColumns,
    _is.WhereExpressionBuilder<NewsletterSubscriberTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<NewsletterSubscriber>(
      rows,
      conflictColumns: conflictColumns(NewsletterSubscriber.t),
      updateColumns: updateColumns?.call(NewsletterSubscriber.t),
      updateWhere: updateWhere?.call(NewsletterSubscriber.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [NewsletterSubscriber] and returns the resulting row.
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
  /// The returned [NewsletterSubscriber] will have its `id` field set.
  Future<NewsletterSubscriber?> upsertRow(
    _is.DatabaseSession session,
    NewsletterSubscriber row, {
    required _is.ColumnSelections<NewsletterSubscriberTable> conflictColumns,
    _is.ColumnSelections<NewsletterSubscriberTable>? updateColumns,
    _is.WhereExpressionBuilder<NewsletterSubscriberTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<NewsletterSubscriber>(
      row,
      conflictColumns: conflictColumns(NewsletterSubscriber.t),
      updateColumns: updateColumns?.call(NewsletterSubscriber.t),
      updateWhere: updateWhere?.call(NewsletterSubscriber.t),
      transaction: transaction,
    );
  }

  /// Updates all [NewsletterSubscriber]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<NewsletterSubscriber>> update(
    _is.DatabaseSession session,
    List<NewsletterSubscriber> rows, {
    _is.ColumnSelections<NewsletterSubscriberTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<NewsletterSubscriber>(
      rows,
      columns: columns?.call(NewsletterSubscriber.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [NewsletterSubscriber]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<NewsletterSubscriber> updateRow(
    _is.DatabaseSession session,
    NewsletterSubscriber row, {
    _is.ColumnSelections<NewsletterSubscriberTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<NewsletterSubscriber>(
      row,
      columns: columns?.call(NewsletterSubscriber.t),
      transaction: transaction,
    );
  }

  /// Updates a single [NewsletterSubscriber] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<NewsletterSubscriber?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<NewsletterSubscriberUpdateTable>
    columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<NewsletterSubscriber>(
      id,
      columnValues: columnValues(NewsletterSubscriber.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [NewsletterSubscriber]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<NewsletterSubscriber>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<NewsletterSubscriberUpdateTable>
    columnValues,
    required _is.WhereExpressionBuilder<NewsletterSubscriberTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<NewsletterSubscriberTable>? orderBy,
    _is.OrderByListBuilder<NewsletterSubscriberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<NewsletterSubscriber>(
      columnValues: columnValues(NewsletterSubscriber.t.updateTable),
      where: where(NewsletterSubscriber.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(NewsletterSubscriber.t),
      orderByList: orderByList?.call(NewsletterSubscriber.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [NewsletterSubscriber]s in the list and returns the deleted rows.
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
  Future<List<NewsletterSubscriber>> delete(
    _is.DatabaseSession session,
    List<NewsletterSubscriber> rows, {
    _is.OrderByBuilder<NewsletterSubscriberTable>? orderBy,
    _is.OrderByListBuilder<NewsletterSubscriberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<NewsletterSubscriber>(
      rows,
      orderBy: orderBy?.call(NewsletterSubscriber.t),
      orderByList: orderByList?.call(NewsletterSubscriber.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [NewsletterSubscriber].
  Future<NewsletterSubscriber> deleteRow(
    _is.DatabaseSession session,
    NewsletterSubscriber row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<NewsletterSubscriber>(
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
  Future<List<NewsletterSubscriber>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<NewsletterSubscriberTable> where,
    _is.OrderByBuilder<NewsletterSubscriberTable>? orderBy,
    _is.OrderByListBuilder<NewsletterSubscriberTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<NewsletterSubscriber>(
      where: where(NewsletterSubscriber.t),
      orderBy: orderBy?.call(NewsletterSubscriber.t),
      orderByList: orderByList?.call(NewsletterSubscriber.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<NewsletterSubscriberTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<NewsletterSubscriber>(
      where: where?.call(NewsletterSubscriber.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [NewsletterSubscriber] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<NewsletterSubscriberTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<NewsletterSubscriber>(
      where: where(NewsletterSubscriber.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
