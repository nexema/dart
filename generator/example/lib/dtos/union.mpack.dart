// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:nexema/messagepack_schema.dart' as _i1;

enum MyUnionFields {
  a,
  b,
  c,
  d,
  e,
  f,
  g,
  h,
  i,
  j,
  k,
  l,
  m,
  none;

  const MyUnionFields();

  static const List<MyUnionFields> _byValue = [a, b, c, d, e, f, g, h, i, j, k, l, m, none];
}

class MyUnion extends _i1.SchemaUnion<MyUnion, MyUnionFields> {
  MyUnion._() {
    _handler = _i1.UnionHandler<MyUnion, MyUnionFields>(_schema);
  }

  factory MyUnion.a(bool a) {
    var instance = MyUnion._();
    instance.a = a;

    return instance;
  }

  factory MyUnion.b(String b) {
    var instance = MyUnion._();
    instance.b = b;

    return instance;
  }

  factory MyUnion.c(int c) {
    var instance = MyUnion._();
    instance.c = c;

    return instance;
  }

  factory MyUnion.d(int d) {
    var instance = MyUnion._();
    instance.d = d;

    return instance;
  }

  factory MyUnion.e(int e) {
    var instance = MyUnion._();
    instance.e = e;

    return instance;
  }

  factory MyUnion.f(BigInt f) {
    var instance = MyUnion._();
    instance.f = f;

    return instance;
  }

  factory MyUnion.g(int g) {
    var instance = MyUnion._();
    instance.g = g;

    return instance;
  }

  factory MyUnion.h(int h) {
    var instance = MyUnion._();
    instance.h = h;

    return instance;
  }

  factory MyUnion.i(int i) {
    var instance = MyUnion._();
    instance.i = i;

    return instance;
  }

  factory MyUnion.j(int j) {
    var instance = MyUnion._();
    instance.j = j;

    return instance;
  }

  factory MyUnion.k(double k) {
    var instance = MyUnion._();
    instance.k = k;

    return instance;
  }

  factory MyUnion.l(double l) {
    var instance = MyUnion._();
    instance.l = l;

    return instance;
  }

  factory MyUnion.m(_i2.Uint8List m) {
    var instance = MyUnion._();
    instance.m = m;

    return instance;
  }

  factory MyUnion.empty() => MyUnion._();

  static const _fieldset = <_i1.FieldInfo>[
    _i1.FieldInfo(
        name: 'a',
        index: 1,
        nullable: false,
        valueType: _i1.FieldValueType.boolean,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'b',
        index: 2,
        nullable: false,
        valueType: _i1.FieldValueType.string,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'c',
        index: 3,
        nullable: false,
        valueType: _i1.FieldValueType.uint8,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'd',
        index: 4,
        nullable: false,
        valueType: _i1.FieldValueType.uint16,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'e',
        index: 5,
        nullable: false,
        valueType: _i1.FieldValueType.uint32,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'f',
        index: 6,
        nullable: false,
        valueType: _i1.FieldValueType.uint64,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'g',
        index: 7,
        nullable: false,
        valueType: _i1.FieldValueType.int8,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'h',
        index: 8,
        nullable: false,
        valueType: _i1.FieldValueType.int16,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'i',
        index: 9,
        nullable: false,
        valueType: _i1.FieldValueType.int32,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'j',
        index: 10,
        nullable: false,
        valueType: _i1.FieldValueType.int64,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'k',
        index: 11,
        nullable: false,
        valueType: _i1.FieldValueType.float32,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'l',
        index: 12,
        nullable: false,
        valueType: _i1.FieldValueType.float64,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'm',
        index: 13,
        nullable: false,
        valueType: _i1.FieldValueType.binary,
        typeArguments: []),
  ];

  static final _defaults = <_i1.DefaultValueGetter>[
    (args) => false,
    (args) => '',
    (args) => 0,
    (args) => 0,
    (args) => 0,
    (args) => 0,
    (args) => 0,
    (args) => 0,
    (args) => 0,
    (args) => 0,
    (args) => 0.0,
    (args) => 0.0,
    (args) => _i2.Uint8List.fromList(const []),
  ];

  final _schema = _i1.SchemaUnionDefinition<MyUnion, MyUnionFields>(_fieldset, 13, _defaults);

  late final _i1.UnionHandler<MyUnion, MyUnionFields> _handler;

  bool get a => _handler.getValue(1);
  set a(bool value) => _handler.setValue(1, value);
  String get b => _handler.getValue(2);
  set b(String value) => _handler.setValue(2, value);
  int get c => _handler.getValue(3);
  set c(int value) => _handler.setValue(3, value);
  int get d => _handler.getValue(4);
  set d(int value) => _handler.setValue(4, value);
  int get e => _handler.getValue(5);
  set e(int value) => _handler.setValue(5, value);
  BigInt get f => _handler.getValue(6);
  set f(BigInt value) => _handler.setValue(6, value);
  int get g => _handler.getValue(7);
  set g(int value) => _handler.setValue(7, value);
  int get h => _handler.getValue(8);
  set h(int value) => _handler.setValue(8, value);
  int get i => _handler.getValue(9);
  set i(int value) => _handler.setValue(9, value);
  int get j => _handler.getValue(10);
  set j(int value) => _handler.setValue(10, value);
  double get k => _handler.getValue(11);
  set k(double value) => _handler.setValue(11, value);
  double get l => _handler.getValue(12);
  set l(double value) => _handler.setValue(12, value);
  _i2.Uint8List get m => _handler.getValue(13);
  set m(_i2.Uint8List value) => _handler.setValue(13, value);
  @override
  int get hashCode => _handler.currentValueHash;
  @override
  bool operator ==(Object other) {
    if (other is! MyUnion) {
      return false;
    }

    return _handler.currentSetField == other._handler.currentSetField &&
        _handler.currentValue == other._handler.currentValue;
  }

  @override
  bool get isSet => _handler.isSet;
  @override
  void clear() => _handler.clear();
  @override
  MyUnion clone() {
    var newInstance = MyUnion._();
    newInstance.mergeUsing(this);

    return newInstance;
  }

  @override
  MyUnionFields get whichField =>
      !isSet ? MyUnionFields.none : MyUnionFields._byValue[_handler.currentSetField!];
  @override
  String toString() {
    if (!_handler.isSet) {
      return "MyUnion(not-set)";
    }

    var currentField = _handler.getCurrentField();
    var value = _handler.currentValue;

    return "MyUnion(${currentField.name}: $value);";
  }

  @override
  _i2.Uint8List serialize() => _handler.getBuffer();
  @override
  void mergeFrom(_i2.Uint8List buffer) => _handler.merge(buffer);
  @override
  void mergeUsing(MyUnion other) => _handler.mergeUsing(other._handler);
  static MyUnion fromBuffer(_i2.Uint8List buffer) {
    var instance = MyUnion._();
    instance.mergeFrom(buffer);

    return instance;
  }
}
