/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'package:vscode_client/src/protocol/catalog/product.dart' as _ifzwkxrt;
import 'package:vscode_client/src/protocol/catalog/product_variant.dart'
    as _ixux0q9f;
import 'catalog/product.dart' as _ixeznjic;
import 'catalog/product_variant.dart' as _iz4qpnk9;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'newsletter/newsletter_subscriber.dart' as _i8w1vddh;
export 'catalog/product.dart';
export 'catalog/product_variant.dart';
export 'greetings/greeting.dart';
export 'newsletter/newsletter_subscriber.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager
    implements _isc.ProtocolDeserializationProvider {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  @override
  _isc.ProtocolDeserialization get deserializationMetadata =>
      _isc.ProtocolDeserialization.cached(
        this,
        types: const [
          _isc.getType<_ixeznjic.Product>,
          _isc.getType<_iz4qpnk9.ProductVariant>,
          _isc.getType<_izw8z7ou.Greeting>,
          _isc.getType<_i8w1vddh.NewsletterSubscriber>,
          _isc.getType<_ixeznjic.Product?>,
          _isc.getType<_iz4qpnk9.ProductVariant?>,
          _isc.getType<_izw8z7ou.Greeting?>,
          _isc.getType<_i8w1vddh.NewsletterSubscriber?>,
          _isc.getType<List<_ifzwkxrt.Product>>,
          _isc.getType<List<_ixux0q9f.ProductVariant>>,
        ],
        modules: const [
          _iaic.Protocol.new,
          _iacc.Protocol.new,
        ],
        classNames: const [
          'Product',
          'ProductVariant',
          'Greeting',
          'NewsletterSubscriber',
        ],
      );

  static String? getClassNameFromObjectJson(dynamic data) =>
      _isc.ProtocolDeserialization.readClassName(data);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    final rawDataClassName = _isc.ProtocolDeserialization.readClassName(data);
    final dataClassName = rawDataClassName;
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _ixeznjic.Product) {
      return _ixeznjic.Product.fromJson(data) as T;
    }
    if (t == _iz4qpnk9.ProductVariant) {
      return _iz4qpnk9.ProductVariant.fromJson(data) as T;
    }
    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _i8w1vddh.NewsletterSubscriber) {
      return _i8w1vddh.NewsletterSubscriber.fromJson(data) as T;
    }
    if (t == _isc.getType<_ixeznjic.Product?>()) {
      return (data != null ? _ixeznjic.Product.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iz4qpnk9.ProductVariant?>()) {
      return (data != null ? _iz4qpnk9.ProductVariant.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i8w1vddh.NewsletterSubscriber?>()) {
      return (data != null
              ? _i8w1vddh.NewsletterSubscriber.fromJson(data)
              : null)
          as T;
    }
    if (t == List<_ifzwkxrt.Product>) {
      return (data as List)
              .map((e) => deserialize<_ifzwkxrt.Product>(e))
              .toList()
          as T;
    }
    if (t == List<_ixux0q9f.ProductVariant>) {
      return (data as List)
              .map((e) => deserialize<_ixux0q9f.ProductVariant>(e))
              .toList()
          as T;
    }
    final modules = deserializationMetadata.modulesForDeserialization(
      t,
      className: rawDataClassName,
    );
    for (final module in modules) {
      try {
        return module.deserialize<T>(data, t);
      } on _isc.DeserializationTypeNotFoundException catch (_) {}
    }

    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _ixeznjic.Product => 'Product',
      _iz4qpnk9.ProductVariant => 'ProductVariant',
      _izw8z7ou.Greeting => 'Greeting',
      _i8w1vddh.NewsletterSubscriber => 'NewsletterSubscriber',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('vscode.', '');
    }

    switch (data) {
      case _ixeznjic.Product():
        return 'Product';
      case _iz4qpnk9.ProductVariant():
        return 'ProductVariant';
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _i8w1vddh.NewsletterSubscriber():
        return 'NewsletterSubscriber';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Product') {
      return deserialize<_ixeznjic.Product>(data['data']);
    }
    if (dataClassName == 'ProductVariant') {
      return deserialize<_iz4qpnk9.ProductVariant>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'NewsletterSubscriber') {
      return deserialize<_i8w1vddh.NewsletterSubscriber>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      return _iaic.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(19),
      });
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      return _iacc.Protocol().deserializeByClassName({
        ...data,
        'className': dataClassName.substring(20),
      });
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('vscode', this);
    _iacc.Protocol().registerHostProtocol('vscode', this);
  }

  @override
  String getModuleName() => 'vscode';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
