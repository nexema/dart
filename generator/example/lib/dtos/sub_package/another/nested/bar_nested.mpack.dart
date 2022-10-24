// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i3;

import 'package:messagepack_schema/messagepack_schema.dart' as _i1;
import 'package:test_files/dtos/sub_package/another/nested/foo_nested.mpack.dart' as _i2;

class MyBarNested extends _i1.SchemaStruct<MyBarNested> {
  MyBarNested._() {
    _handler = _i1.StructHandler<MyBarNested>(_schema);
  }

  factory MyBarNested({_i2.MyNestedType? first}) {
    var instance = MyBarNested._();
    instance._schema.setFields([first ?? _i2.MyNestedType()]);
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
    (args) => _i2.MyNestedType(),
  ];

  final _schema = _i1.SchemaStructDefinition<MyBarNested>(_fieldset, 1, _defaults);

  late final _i1.StructHandler<MyBarNested> _handler;

  _i2.MyNestedType get first => _handler.getValue(1);
  set first(_i2.MyNestedType value) => _handler.setValue(1, value);
  @override
  int get hashCode => _handler.getHash(() => Object.hashAll([first]));
  @override
  bool operator ==(Object other) {
    if (other is! MyBarNested) {
      return false;
    }

    return first == other.first;
  }

  @override
  String toString() => 'first($first)';
  @override
  MyBarNested clone() {
    var newInstance = MyBarNested._();
    newInstance.mergeUsing(this);

    return newInstance;
  }

  @override
  _i3.Uint8List serialize() => _handler.getBuffer();
  @override
  void mergeFrom(_i3.Uint8List buffer) => _handler.merge(buffer);
  @override
  void mergeUsing(MyBarNested other) => _handler.mergeUsing(other._handler);
  static MyBarNested fromBuffer(_i3.Uint8List buffer) {
    var instance = MyBarNested._();
    instance.mergeFrom(buffer);

    return instance;
  }
}
