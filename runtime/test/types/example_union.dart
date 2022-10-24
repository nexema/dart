import 'dart:typed_data';

import 'package:messagepack_schema/messagepack_schema.dart';

class ExampleUnion extends SchemaUnion<ExampleUnion, ExampleUnionFields> {
  static const _fieldset = <FieldInfo>[
    FieldInfo(name: "name", index: 0, nullable: false, valueType: FieldValueType.string, typeArguments: null),
    FieldInfo(name: "enabled", index: 1, nullable: false, valueType: FieldValueType.boolean, typeArguments: null),
    FieldInfo(name: "age", index: 2, nullable: false, valueType: FieldValueType.uint8, typeArguments: null),
  ];

  static final _defaults = <DefaultValueGetter>[
    (_) => "",
    (_) => false,
    (_) => 0,
  ];

  final _schema = SchemaUnionDefinition<ExampleUnion, ExampleUnionFields>(_fieldset, 3, _defaults);
  late final UnionHandler _handler;

  ExampleUnion._() {
    _handler = UnionHandler<ExampleUnion, ExampleUnionFields>(_schema);
  }

  factory ExampleUnion.empty() => ExampleUnion._();
  
  factory ExampleUnion.name(String name) {
    var instance = ExampleUnion._();
    instance.name = name;

    return instance;
  }

  factory ExampleUnion.enabled(bool enabled) {
    var instance = ExampleUnion._();
    instance.enabled = enabled;

    return instance;
  }

  factory ExampleUnion.age(int age) {
    var instance = ExampleUnion._();
    instance.age = age;

    return instance;
  }

  @override
  ExampleUnion clone() {
    var newInstance = ExampleUnion._();
    newInstance.mergeUsing(this);

    return newInstance;
  }

  String get name => _handler.getValue(0);
  set name(String name) => _handler.setValue(0, name);

  bool get enabled => _handler.getValue(1);
  set enabled(bool name) => _handler.setValue(1, name);

  int get age => _handler.getValue(2);
  set age(int name) => _handler.setValue(2, name);

  @override
  int get hashCode => _handler.currentValueHash;
  
  @override
  bool operator ==(Object other) {
    if(other is! ExampleUnion) {
      return false;
    }

    return _handler.currentSetField == other._handler.currentSetField
      && _handler.currentValue == other._handler.currentValue;
  }

  @override
  String toString() {
    if(!_handler.isSet) {
      return "ExampleUnion(not-set)";
    }

    var currentField = _handler.getCurrentField();
    var value = _handler.currentValue;

    return "ExampleUnion(${currentField.name}: $value)";
  }
  
  @override
  bool get isSet => _handler.isSet;
  
  @override
  void clear() {
    _handler.clear();
  }
  
  @override
  ExampleUnionFields get whichField => !isSet ? ExampleUnionFields.none : ExampleUnionFields._byValue[_handler.currentSetField!];

  @override
  void mergeFrom(Uint8List buffer) => _handler.merge(buffer);

  @override
  void mergeUsing(ExampleUnion other) => _handler.mergeUsing(other._handler);

  @override
  Uint8List serialize() => _handler.getBuffer();
}

enum ExampleUnionFields {
  none, 
  name, 
  enabled, 
  age;

  const ExampleUnionFields();

  static const List<ExampleUnionFields> _byValue = [
    name,
    enabled,
    age
  ];
}