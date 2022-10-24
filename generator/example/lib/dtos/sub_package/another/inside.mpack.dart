// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:messagepack_schema/messagepack_schema.dart' as _i1;
import 'package:test_files/dtos/sub_package/another/inside.mpack.dart' as _i2;

class AnotherType extends _i1.SchemaStruct<AnotherType> {
  AnotherType._() {
    _handler = _i1.StructHandler<AnotherType>(_schema);
  }

  factory AnotherType({
    String first = '',
    bool second = false,
    _i2.AnotherEnum status = AnotherEnum.unknown,
  }) {
    var instance = AnotherType._();
    instance._schema.setFields([
      first,
      second,
    ]);
    return instance;
  }

  static const _fieldset = <_i1.FieldInfo>[
    _i1.FieldInfo(
        name: 'first',
        index: 1,
        nullable: false,
        valueType: _i1.FieldValueType.string,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'second',
        index: 2,
        nullable: false,
        valueType: _i1.FieldValueType.boolean,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'status',
        index: 3,
        nullable: false,
        valueType: _i1.FieldValueType.custom,
        typeArguments: []),
  ];

  static final _defaults = <_i1.DefaultValueGetter>[
    (args) => '',
    (args) => false,
    (args) => AnotherEnum.values[args!.first],
  ];

  final _schema = _i1.SchemaStructDefinition<AnotherType>(_fieldset, 3, _defaults);

  late final _i1.StructHandler<AnotherType> _handler;

  String get first => _handler.getValue(1);
  set first(String value) => _handler.setValue(1, value);
  bool get second => _handler.getValue(2);
  set second(bool value) => _handler.setValue(2, value);
  _i2.AnotherEnum get status => _handler.getValue(3);
  set status(_i2.AnotherEnum value) => _handler.setValue(3, value);
  @override
  int get hashCode => _handler.getHash(() => Object.hashAll([first, second, status]));
  @override
  bool operator ==(Object other) {
    if (other is! AnotherType) {
      return false;
    }

    return first == other.first && second == other.second && status == other.status;
  }

  @override
  String toString() => 'first($first) second($second) status($status)';
  @override
  AnotherType clone() {
    var newInstance = AnotherType._();
    newInstance.mergeUsing(this);

    return newInstance;
  }

  @override
  _i3.Uint8List serialize() => _handler.getBuffer();
  @override
  void mergeFrom(_i3.Uint8List buffer) => _handler.merge(buffer);
  @override
  void mergeUsing(AnotherType other) => _handler.mergeUsing(other._handler);
  static AnotherType fromBuffer(_i3.Uint8List buffer) {
    var instance = AnotherType._();
    instance.mergeFrom(buffer);

    return instance;
  }
}

class AnotherEnum extends _i1.SchemaEnum<AnotherEnum> {
  const AnotherEnum._(
    int index,
    String name,
  ) : super(index, name);

  static const AnotherEnum unknown = AnotherEnum._(0, "unknown");

  static const AnotherEnum success = AnotherEnum._(1, "success");

  static const AnotherEnum failed = AnotherEnum._(2, "failed");

  static const List<AnotherEnum> values = [unknown, success, failed];

  static const Map<String, AnotherEnum> _byName = {
    "unknown": unknown,
    "success": success,
    "failed": failed
  };

  static AnotherEnum valueOf(int index) {
    try {
      return values[index];
    } catch (_) {
      throw _i1.EnumNotFound.byIndex(index);
    }
  }

  static AnotherEnum fromName(String name) {
    try {
      return _byName[name]!;
    } catch (_) {
      throw _i1.EnumNotFound.byName(name);
    }
  }
}
