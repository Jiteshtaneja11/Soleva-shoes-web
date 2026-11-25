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

abstract class NewsletterSubscriber
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
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
      subscribedAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['subscribedAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String email;

  DateTime subscribedAt;

  /// Returns a shallow copy of this [NewsletterSubscriber]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
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

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
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
  @_isc.useResult
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
