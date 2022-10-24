import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:messagepack_schema/messagepack_schema.dart';

import 'example_enum_type.dart';
import 'example_union.dart';

class ExampleStruct extends SchemaStruct<ExampleStruct> {
  static const _collectionEquality = DeepCollectionEquality();

  static const _fieldset = <FieldInfo>[
    FieldInfo(name: "name", index: 0, nullable: true, valueType: FieldValueType.string, typeArguments: null),
    FieldInfo(name: "names", index: 1, nullable: false, valueType: FieldValueType.list, typeArguments: [FieldValueType.string]),
    FieldInfo(name: "config", index: 2, nullable: false, valueType: FieldValueType.map, typeArguments: [FieldValueType.string, FieldValueType.int64]),
    FieldInfo(name: 'myUnion', index: 3, nullable: false, valueType: FieldValueType.custom, typeArguments: null),
    FieldInfo(name: 'anotherStruct', index: 4, nullable: false, valueType: FieldValueType.custom, typeArguments: null),
  ];
  static final _defaults = <DefaultValueGetter>[
    (_) => "",
    (_) => <String>[],
    (_) => <String, int>{},
    (_) => ExampleUnion.empty(),
    (_) => AnotherStruct()
  ];

  final _schema = SchemaStructDefinition<ExampleStruct>(_fieldset, 5, _defaults);
  late final StructHandler<ExampleStruct> _handler;

  ExampleStruct._() {
    _handler = StructHandler<ExampleStruct>(_schema);
  }

  factory ExampleStruct({
    String? name,
    List<String> names = const [],
    Map<String, int> config = const {},
    ExampleUnion? myUnion,
    required AnotherStruct anotherStruct
  }) {
    var instance = ExampleStruct._();
    instance._schema.setFields([
      name,
      names,
      config,
      myUnion ?? ExampleUnion.empty(),
      anotherStruct
    ]);
    return instance;
  }

  @override
  ExampleStruct clone() {
    var newInstance = ExampleStruct._();
    newInstance.mergeUsing(this);

    return newInstance;
  }

  String? get name => _handler.getValue<String?>(0);
  set name(String? name) => _handler.setValue(0, name);

  List<String> get names => _handler.getValue<List<String>>(1);
  set names(List<String> names) => _handler.setList(1, names);

  Map<String, int> get config => _handler.getValue<Map<String, int>>(2);
  set config(Map<String, int> config) => _handler.setMap(2, config);

  ExampleUnion get myUnion => _handler.getValue<ExampleUnion>(3);
  set myUnion(ExampleUnion myUnion) => _handler.setValue(3, myUnion);

  AnotherStruct get anotherStruct => _handler.getValue<AnotherStruct>(4);
  set anotherStruct(AnotherStruct anotherStruct) => _handler.setValue(4, anotherStruct);

  @override
  int get hashCode => _handler.getHash(() => Object.hash(name, names, config, myUnion, anotherStruct));
  
  @override
  bool operator ==(Object other) {
    if(other is! ExampleStruct) {
      return false;
    }

    return name == other.name
      && _collectionEquality.equals(names, other.names)
      && _collectionEquality.equals(config, other.config)
      && myUnion == other.myUnion
      && anotherStruct == other.anotherStruct;
  }

  @override
  String toString() => "name($name) names($names) config($config) myUnion($myUnion) anotherStruct($anotherStruct)";

  @override
  Uint8List serialize() => _handler.getBuffer();

  @override
  void mergeFrom(Uint8List buffer) => _handler.merge(buffer);

  @override
  void mergeUsing(ExampleStruct other) => _handler.mergeUsing(other._handler);

  static ExampleStruct fromBuffer(Uint8List buffer) {
    var instance = ExampleStruct._();
    instance.mergeFrom(buffer);

    return instance;
  }
}

class AnotherStruct extends SchemaStruct<AnotherStruct> {
  static const _fieldset = <FieldInfo>[
    FieldInfo(name: "name", index: 0, nullable: false, valueType: FieldValueType.string, typeArguments: null),
    FieldInfo(name: 'myEnum', index: 1, nullable: false, valueType: FieldValueType.custom, typeArguments: null, isEnum: true),
  ];
  static final _defaults = <DefaultValueGetter>[
    (_) => "",
    (args) => ExampleEnumType.values[args!.first]
  ];

  final _schema = SchemaStructDefinition<AnotherStruct>(_fieldset, 2, _defaults);
  late final StructHandler<AnotherStruct> _handler;

  AnotherStruct._() {
    _handler = StructHandler<AnotherStruct>(_schema);
  }

  factory AnotherStruct({
    String name = "",
    ExampleEnumType myEnum = ExampleEnumType.unknown
  }) {
    var instance = AnotherStruct._();
    instance._schema.setFields([
      name,
      myEnum
    ]);

    return instance;
  }

  @override
  AnotherStruct clone() {
    var newInstance = AnotherStruct._();
    newInstance.mergeUsing(this);

    return newInstance;
  }

  String get name => _handler.getValue<String>(0);
  set name(String name) => _handler.setValue(0, name);

  ExampleEnumType get myEnum => _handler.getValue<ExampleEnumType>(1);
  set myEnum(ExampleEnumType myEnum) => _handler.setValue(1, myEnum);

  @override
  int get hashCode => _handler.getHash(() => Object.hash(name, myEnum));
  
  @override
  bool operator ==(Object other) {
    if(other is! AnotherStruct) {
      return false;
    }

    return name == other.name
      && myEnum == other.myEnum;
  }

  @override
  String toString() => "name($name) myEnum(${myEnum.name})";

  @override
  Uint8List serialize() => _handler.getBuffer();

  @override
  void mergeFrom(Uint8List buffer) => _handler.merge(buffer);

  @override
  void mergeUsing(AnotherStruct other) => _handler.mergeUsing(other._handler);
}