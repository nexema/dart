// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:messagepack_schema/messagepack_schema.dart' as _i1;
import 'package:test_files/dtos/sub_package/another/inside.mpack.dart' as _i2;

class MyNestedType extends _i1.SchemaStruct<MyNestedType> {
  MyNestedType._() {
    _handler = _i1.StructHandler<MyNestedType>(_schema);
  }

  factory MyNestedType({_i2.AnotherType? first}) {
    var instance = MyNestedType._();
    instance._schema.setFields([first ?? _i2.AnotherType()]);
    return instance;
  }

  static const _fieldset = <_i1.FieldInfo>[
    _i1.FieldInfo(
        name: 'first',
        index: 1,
        nullable: false,
        valueType: _i1.FieldValueType.custom,
        typeArguments: []),
  ];

  static final _defaults = <_i1.DefaultValueGetter>[
    (args) => _i2.AnotherType(),
  ];

  final _schema = _i1.SchemaStructDefinition<MyNestedType>(_fieldset, 1, _defaults);

  late final _i1.StructHandler<MyNestedType> _handler;

  _i2.AnotherType get first => _handler.getValue(1);
  set first(_i2.AnotherType value) => _handler.setValue(1, value);
  @override
  int get hashCode => _handler.getHash(() => Object.hashAll([first]));
  @override
  bool operator ==(Object other) {
    if (other is! MyNestedType) {
      return false;
    }

    return first == other.first;
  }

  @override
  String toString() => 'first($first)';
  @override
  MyNestedType clone() {
    var newInstance = MyNestedType._();
    newInstance.mergeUsing(this);

    return newInstance;
  }

  @override
  _i3.Uint8List serialize() => _handler.getBuffer();
  @override
  void mergeFrom(_i3.Uint8List buffer) => _handler.merge(buffer);
  @override
  void mergeUsing(MyNestedType other) => _handler.mergeUsing(other._handler);
  static MyNestedType fromBuffer(_i3.Uint8List buffer) {
    var instance = MyNestedType._();
    instance.mergeFrom(buffer);

    return instance;
  }
}
