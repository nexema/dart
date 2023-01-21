// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:nexema/messagepack_schema.dart' as _i1;

class Nullables extends _i1.SchemaStruct<Nullables> {
  Nullables._() {
    _handler = _i1.StructHandler<Nullables>(_schema);
  }

  factory Nullables({
    bool? a1,
    String? a2,
    int? a3,
    int? a4,
    int? a5,
    BigInt? a6,
    int? a7,
    int? a8,
    int? a9,
    int? a10,
    double? a11,
    double? a12,
    _i2.Uint8List? a13,
    List<bool?> a14 = const [],
    Map<String, double?> a15 = const {},
  }) {
    var instance = Nullables._();
    instance._schema.setFields([
      a1,
      a2,
      a3,
      a4,
      a5,
      a6,
      a7,
      a8,
      a9,
      a10,
      a11,
      a12,
      a13,
      a14,
      a15,
    ]);
    return instance;
  }

  static const _fieldset = <_i1.FieldInfo>[
    _i1.FieldInfo(
        name: 'a1',
        index: 1,
        nullable: true,
        valueType: _i1.FieldValueType.boolean,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'a2',
        index: 2,
        nullable: true,
        valueType: _i1.FieldValueType.string,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'a3',
        index: 3,
        nullable: true,
        valueType: _i1.FieldValueType.uint8,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'a4',
        index: 4,
        nullable: true,
        valueType: _i1.FieldValueType.uint16,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'a5',
        index: 5,
        nullable: true,
        valueType: _i1.FieldValueType.uint32,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'a6',
        index: 6,
        nullable: true,
        valueType: _i1.FieldValueType.uint64,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'a7',
        index: 7,
        nullable: true,
        valueType: _i1.FieldValueType.int8,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'a8',
        index: 8,
        nullable: true,
        valueType: _i1.FieldValueType.int16,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'a9',
        index: 9,
        nullable: true,
        valueType: _i1.FieldValueType.int32,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'a10',
        index: 10,
        nullable: true,
        valueType: _i1.FieldValueType.int64,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'a11',
        index: 11,
        nullable: true,
        valueType: _i1.FieldValueType.float32,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'a12',
        index: 12,
        nullable: true,
        valueType: _i1.FieldValueType.float64,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'a13',
        index: 13,
        nullable: true,
        valueType: _i1.FieldValueType.binary,
        typeArguments: []),
    _i1.FieldInfo(
        name: 'a14',
        index: 14,
        nullable: false,
        valueType: _i1.FieldValueType.list,
        typeArguments: [_i1.FieldValueType.boolean]),
    _i1.FieldInfo(
        name: 'a15',
        index: 15,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.string, _i1.FieldValueType.float32]),
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
    (args) => <bool>[],
    (args) => <String, double>{},
  ];

  final _schema = _i1.SchemaStructDefinition<Nullables>(_fieldset, 15, _defaults);

  late final _i1.StructHandler<Nullables> _handler;

  bool? get a1 => _handler.getValue(1);
  set a1(bool? value) => _handler.setValue(1, value);
  String? get a2 => _handler.getValue(2);
  set a2(String? value) => _handler.setValue(2, value);
  int? get a3 => _handler.getValue(3);
  set a3(int? value) => _handler.setValue(3, value);
  int? get a4 => _handler.getValue(4);
  set a4(int? value) => _handler.setValue(4, value);
  int? get a5 => _handler.getValue(5);
  set a5(int? value) => _handler.setValue(5, value);
  BigInt? get a6 => _handler.getValue(6);
  set a6(BigInt? value) => _handler.setValue(6, value);
  int? get a7 => _handler.getValue(7);
  set a7(int? value) => _handler.setValue(7, value);
  int? get a8 => _handler.getValue(8);
  set a8(int? value) => _handler.setValue(8, value);
  int? get a9 => _handler.getValue(9);
  set a9(int? value) => _handler.setValue(9, value);
  int? get a10 => _handler.getValue(10);
  set a10(int? value) => _handler.setValue(10, value);
  double? get a11 => _handler.getValue(11);
  set a11(double? value) => _handler.setValue(11, value);
  double? get a12 => _handler.getValue(12);
  set a12(double? value) => _handler.setValue(12, value);
  _i2.Uint8List? get a13 => _handler.getValue(13);
  set a13(_i2.Uint8List? value) => _handler.setValue(13, value);
  List<bool?> get a14 => _handler.getValue(14);
  set a14(List<bool?> value) => _handler.setList(14, value);
  Map<String, double?> get a15 => _handler.getValue(15);
  set a15(Map<String, double?> value) => _handler.setMap(15, value);
  @override
  int get hashCode => _handler.getHash(
      () => Object.hashAll([a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15]));
  @override
  bool operator ==(Object other) {
    if (other is! Nullables) {
      return false;
    }

    return a1 == other.a1 &&
        a2 == other.a2 &&
        a3 == other.a3 &&
        a4 == other.a4 &&
        a5 == other.a5 &&
        a6 == other.a6 &&
        a7 == other.a7 &&
        a8 == other.a8 &&
        a9 == other.a9 &&
        a10 == other.a10 &&
        a11 == other.a11 &&
        a12 == other.a12 &&
        a13 == other.a13 &&
        _i1.kDeepCollectionEquality.equals(a14, other.a14) &&
        _i1.kDeepCollectionEquality.equals(a15, other.a15);
  }

  @override
  String toString() =>
      'a1($a1) a2($a2) a3($a3) a4($a4) a5($a5) a6($a6) a7($a7) a8($a8) a9($a9) a10($a10) a11($a11) a12($a12) a13($a13) a14($a14) a15($a15)';
  @override
  Nullables clone() {
    var newInstance = Nullables._();
    newInstance.mergeUsing(this);

    return newInstance;
  }

  @override
  _i2.Uint8List serialize() => _handler.getBuffer();
  @override
  void mergeFrom(_i2.Uint8List buffer) => _handler.merge(buffer);
  @override
  void mergeUsing(Nullables other) => _handler.mergeUsing(other._handler);
  static Nullables fromBuffer(_i2.Uint8List buffer) {
    var instance = Nullables._();
    instance.mergeFrom(buffer);

    return instance;
  }
}
