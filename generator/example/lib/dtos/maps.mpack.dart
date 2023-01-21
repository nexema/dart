// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:nexema/messagepack_schema.dart' as _i1;

class Default extends _i1.SchemaStruct<Default> {
  Default._() {
    _handler = _i1.StructHandler<Default>(_schema);
  }

  factory Default({
    Map<String, bool> a1 = const {},
    Map<String, String> a2 = const {},
    Map<String, int> a3 = const {},
    Map<String, int> a4 = const {},
    Map<String, int> a5 = const {},
    Map<String, BigInt> a6 = const {},
    Map<String, int> a7 = const {},
    Map<String, int> a8 = const {},
    Map<String, int> a9 = const {},
    Map<String, int> a10 = const {},
    Map<String, double> a11 = const {},
    Map<String, double> a12 = const {},
    Map<int, bool> b1 = const {},
    Map<int, String> b2 = const {},
    Map<int, int> b3 = const {},
    Map<int, int> b4 = const {},
    Map<int, int> b5 = const {},
    Map<int, BigInt> b6 = const {},
    Map<int, int> b7 = const {},
    Map<int, int> b8 = const {},
    Map<int, int> b9 = const {},
    Map<int, int> b10 = const {},
    Map<int, double> b11 = const {},
    Map<int, double> b12 = const {},
    Map<int, bool> c1 = const {},
    Map<int, String> c2 = const {},
    Map<int, int> c3 = const {},
    Map<int, int> c4 = const {},
    Map<int, int> c5 = const {},
    Map<int, BigInt> c6 = const {},
    Map<int, int> c7 = const {},
    Map<int, int> c8 = const {},
    Map<int, int> c9 = const {},
    Map<int, int> c10 = const {},
    Map<int, double> c11 = const {},
    Map<int, double> c12 = const {},
    Map<int, bool> d1 = const {},
    Map<int, String> d2 = const {},
    Map<int, int> d3 = const {},
    Map<int, int> d4 = const {},
    Map<int, int> d5 = const {},
    Map<int, BigInt> d6 = const {},
    Map<int, int> d7 = const {},
    Map<int, int> d8 = const {},
    Map<int, int> d9 = const {},
    Map<int, int> d10 = const {},
    Map<int, double> d11 = const {},
    Map<int, double> d12 = const {},
    Map<BigInt, bool> e1 = const {},
    Map<BigInt, String> e2 = const {},
    Map<BigInt, int> e3 = const {},
    Map<BigInt, int> e4 = const {},
    Map<BigInt, int> e5 = const {},
    Map<BigInt, BigInt> e6 = const {},
    Map<BigInt, int> e7 = const {},
    Map<BigInt, int> e8 = const {},
    Map<BigInt, int> e9 = const {},
    Map<BigInt, int> e10 = const {},
    Map<BigInt, double> e11 = const {},
    Map<BigInt, double> e12 = const {},
    Map<int, bool> f1 = const {},
    Map<int, String> f2 = const {},
    Map<int, int> f3 = const {},
    Map<int, int> f4 = const {},
    Map<int, int> f5 = const {},
    Map<int, BigInt> f6 = const {},
    Map<int, int> f7 = const {},
    Map<int, int> f8 = const {},
    Map<int, int> f9 = const {},
    Map<int, int> f10 = const {},
    Map<int, double> f11 = const {},
    Map<int, double> f12 = const {},
    Map<int, bool> g1 = const {},
    Map<int, String> g2 = const {},
    Map<int, int> g3 = const {},
    Map<int, int> g4 = const {},
    Map<int, int> g5 = const {},
    Map<int, BigInt> g6 = const {},
    Map<int, int> g7 = const {},
    Map<int, int> g8 = const {},
    Map<int, int> g9 = const {},
    Map<int, int> g10 = const {},
    Map<int, double> g11 = const {},
    Map<int, double> g12 = const {},
    Map<int, bool> h1 = const {},
    Map<int, String> h2 = const {},
    Map<int, int> h3 = const {},
    Map<int, int> h4 = const {},
    Map<int, int> h5 = const {},
    Map<int, BigInt> h6 = const {},
    Map<int, int> h7 = const {},
    Map<int, int> h8 = const {},
    Map<int, int> h9 = const {},
    Map<int, int> h10 = const {},
    Map<int, double> h11 = const {},
    Map<int, double> h12 = const {},
    Map<int, bool> i1 = const {},
    Map<int, String> i2 = const {},
    Map<int, int> i3 = const {},
    Map<int, int> i4 = const {},
    Map<int, int> i5 = const {},
    Map<int, BigInt> i6 = const {},
    Map<int, int> i7 = const {},
    Map<int, int> i8 = const {},
    Map<int, int> i9 = const {},
    Map<int, int> i10 = const {},
    Map<int, double> i11 = const {},
    Map<int, double> i12 = const {},
    Map<double, bool> j1 = const {},
    Map<double, String> j2 = const {},
    Map<double, int> j3 = const {},
    Map<double, int> j4 = const {},
    Map<double, int> j5 = const {},
    Map<double, BigInt> j6 = const {},
    Map<double, int> j7 = const {},
    Map<double, int> j8 = const {},
    Map<double, int> j9 = const {},
    Map<double, int> j10 = const {},
    Map<double, double> j11 = const {},
    Map<double, double> j12 = const {},
    Map<double, bool> k1 = const {},
    Map<double, String> k2 = const {},
    Map<double, int> k3 = const {},
    Map<double, int> k4 = const {},
    Map<double, int> k5 = const {},
    Map<double, BigInt> k6 = const {},
    Map<double, int> k7 = const {},
    Map<double, int> k8 = const {},
    Map<double, int> k9 = const {},
    Map<double, int> k10 = const {},
    Map<double, double> k11 = const {},
    Map<double, double> k12 = const {},
  }) {
    var instance = Default._();
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
      b1,
      b2,
      b3,
      b4,
      b5,
      b6,
      b7,
      b8,
      b9,
      b10,
      b11,
      b12,
      c1,
      c2,
      c3,
      c4,
      c5,
      c6,
      c7,
      c8,
      c9,
      c10,
      c11,
      c12,
      d1,
      d2,
      d3,
      d4,
      d5,
      d6,
      d7,
      d8,
      d9,
      d10,
      d11,
      d12,
      e1,
      e2,
      e3,
      e4,
      e5,
      e6,
      e7,
      e8,
      e9,
      e10,
      e11,
      e12,
      f1,
      f2,
      f3,
      f4,
      f5,
      f6,
      f7,
      f8,
      f9,
      f10,
      f11,
      f12,
      g1,
      g2,
      g3,
      g4,
      g5,
      g6,
      g7,
      g8,
      g9,
      g10,
      g11,
      g12,
      h1,
      h2,
      h3,
      h4,
      h5,
      h6,
      h7,
      h8,
      h9,
      h10,
      h11,
      h12,
      i1,
      i2,
      i3,
      i4,
      i5,
      i6,
      i7,
      i8,
      i9,
      i10,
      i11,
      i12,
      j1,
      j2,
      j3,
      j4,
      j5,
      j6,
      j7,
      j8,
      j9,
      j10,
      j11,
      j12,
      k1,
      k2,
      k3,
      k4,
      k5,
      k6,
      k7,
      k8,
      k9,
      k10,
      k11,
      k12,
    ]);
    return instance;
  }

  static const _fieldset = <_i1.FieldInfo>[
    _i1.FieldInfo(
        name: 'a1',
        index: 1,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.string, _i1.FieldValueType.boolean]),
    _i1.FieldInfo(
        name: 'a2',
        index: 2,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.string, _i1.FieldValueType.string]),
    _i1.FieldInfo(
        name: 'a3',
        index: 3,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.string, _i1.FieldValueType.uint8]),
    _i1.FieldInfo(
        name: 'a4',
        index: 4,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.string, _i1.FieldValueType.uint16]),
    _i1.FieldInfo(
        name: 'a5',
        index: 5,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.string, _i1.FieldValueType.uint32]),
    _i1.FieldInfo(
        name: 'a6',
        index: 6,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.string, _i1.FieldValueType.uint64]),
    _i1.FieldInfo(
        name: 'a7',
        index: 7,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.string, _i1.FieldValueType.int8]),
    _i1.FieldInfo(
        name: 'a8',
        index: 8,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.string, _i1.FieldValueType.int16]),
    _i1.FieldInfo(
        name: 'a9',
        index: 9,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.string, _i1.FieldValueType.int32]),
    _i1.FieldInfo(
        name: 'a10',
        index: 10,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.string, _i1.FieldValueType.int64]),
    _i1.FieldInfo(
        name: 'a11',
        index: 11,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.string, _i1.FieldValueType.float32]),
    _i1.FieldInfo(
        name: 'a12',
        index: 12,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.string, _i1.FieldValueType.float64]),
    _i1.FieldInfo(
        name: 'b1',
        index: 14,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint8, _i1.FieldValueType.boolean]),
    _i1.FieldInfo(
        name: 'b2',
        index: 15,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint8, _i1.FieldValueType.string]),
    _i1.FieldInfo(
        name: 'b3',
        index: 16,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint8, _i1.FieldValueType.uint8]),
    _i1.FieldInfo(
        name: 'b4',
        index: 17,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint8, _i1.FieldValueType.uint16]),
    _i1.FieldInfo(
        name: 'b5',
        index: 18,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint8, _i1.FieldValueType.uint32]),
    _i1.FieldInfo(
        name: 'b6',
        index: 19,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint8, _i1.FieldValueType.uint64]),
    _i1.FieldInfo(
        name: 'b7',
        index: 20,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint8, _i1.FieldValueType.int8]),
    _i1.FieldInfo(
        name: 'b8',
        index: 21,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint8, _i1.FieldValueType.int16]),
    _i1.FieldInfo(
        name: 'b9',
        index: 22,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint8, _i1.FieldValueType.int32]),
    _i1.FieldInfo(
        name: 'b10',
        index: 23,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint8, _i1.FieldValueType.int64]),
    _i1.FieldInfo(
        name: 'b11',
        index: 24,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint8, _i1.FieldValueType.float32]),
    _i1.FieldInfo(
        name: 'b12',
        index: 25,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint8, _i1.FieldValueType.float64]),
    _i1.FieldInfo(
        name: 'c1',
        index: 27,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint16, _i1.FieldValueType.boolean]),
    _i1.FieldInfo(
        name: 'c2',
        index: 28,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint16, _i1.FieldValueType.string]),
    _i1.FieldInfo(
        name: 'c3',
        index: 29,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint16, _i1.FieldValueType.uint8]),
    _i1.FieldInfo(
        name: 'c4',
        index: 30,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint16, _i1.FieldValueType.uint16]),
    _i1.FieldInfo(
        name: 'c5',
        index: 31,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint16, _i1.FieldValueType.uint32]),
    _i1.FieldInfo(
        name: 'c6',
        index: 32,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint16, _i1.FieldValueType.uint64]),
    _i1.FieldInfo(
        name: 'c7',
        index: 33,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint16, _i1.FieldValueType.int8]),
    _i1.FieldInfo(
        name: 'c8',
        index: 34,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint16, _i1.FieldValueType.int16]),
    _i1.FieldInfo(
        name: 'c9',
        index: 35,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint16, _i1.FieldValueType.int32]),
    _i1.FieldInfo(
        name: 'c10',
        index: 36,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint16, _i1.FieldValueType.int64]),
    _i1.FieldInfo(
        name: 'c11',
        index: 37,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint16, _i1.FieldValueType.float32]),
    _i1.FieldInfo(
        name: 'c12',
        index: 38,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint16, _i1.FieldValueType.float64]),
    _i1.FieldInfo(
        name: 'd1',
        index: 40,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint32, _i1.FieldValueType.boolean]),
    _i1.FieldInfo(
        name: 'd2',
        index: 41,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint32, _i1.FieldValueType.string]),
    _i1.FieldInfo(
        name: 'd3',
        index: 42,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint32, _i1.FieldValueType.uint8]),
    _i1.FieldInfo(
        name: 'd4',
        index: 43,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint32, _i1.FieldValueType.uint16]),
    _i1.FieldInfo(
        name: 'd5',
        index: 44,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint32, _i1.FieldValueType.uint32]),
    _i1.FieldInfo(
        name: 'd6',
        index: 45,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint32, _i1.FieldValueType.uint64]),
    _i1.FieldInfo(
        name: 'd7',
        index: 46,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint32, _i1.FieldValueType.int8]),
    _i1.FieldInfo(
        name: 'd8',
        index: 47,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint32, _i1.FieldValueType.int16]),
    _i1.FieldInfo(
        name: 'd9',
        index: 48,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint32, _i1.FieldValueType.int32]),
    _i1.FieldInfo(
        name: 'd10',
        index: 49,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint32, _i1.FieldValueType.int64]),
    _i1.FieldInfo(
        name: 'd11',
        index: 50,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint32, _i1.FieldValueType.float32]),
    _i1.FieldInfo(
        name: 'd12',
        index: 51,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint32, _i1.FieldValueType.float64]),
    _i1.FieldInfo(
        name: 'e1',
        index: 53,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint64, _i1.FieldValueType.boolean]),
    _i1.FieldInfo(
        name: 'e2',
        index: 54,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint64, _i1.FieldValueType.string]),
    _i1.FieldInfo(
        name: 'e3',
        index: 55,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint64, _i1.FieldValueType.uint8]),
    _i1.FieldInfo(
        name: 'e4',
        index: 56,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint64, _i1.FieldValueType.uint16]),
    _i1.FieldInfo(
        name: 'e5',
        index: 57,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint64, _i1.FieldValueType.uint32]),
    _i1.FieldInfo(
        name: 'e6',
        index: 58,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint64, _i1.FieldValueType.uint64]),
    _i1.FieldInfo(
        name: 'e7',
        index: 59,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint64, _i1.FieldValueType.int8]),
    _i1.FieldInfo(
        name: 'e8',
        index: 60,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint64, _i1.FieldValueType.int16]),
    _i1.FieldInfo(
        name: 'e9',
        index: 61,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint64, _i1.FieldValueType.int32]),
    _i1.FieldInfo(
        name: 'e10',
        index: 62,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint64, _i1.FieldValueType.int64]),
    _i1.FieldInfo(
        name: 'e11',
        index: 63,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint64, _i1.FieldValueType.float32]),
    _i1.FieldInfo(
        name: 'e12',
        index: 64,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.uint64, _i1.FieldValueType.float64]),
    _i1.FieldInfo(
        name: 'f1',
        index: 66,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int8, _i1.FieldValueType.boolean]),
    _i1.FieldInfo(
        name: 'f2',
        index: 67,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int8, _i1.FieldValueType.string]),
    _i1.FieldInfo(
        name: 'f3',
        index: 68,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int8, _i1.FieldValueType.uint8]),
    _i1.FieldInfo(
        name: 'f4',
        index: 69,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int8, _i1.FieldValueType.uint16]),
    _i1.FieldInfo(
        name: 'f5',
        index: 70,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int8, _i1.FieldValueType.uint32]),
    _i1.FieldInfo(
        name: 'f6',
        index: 71,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int8, _i1.FieldValueType.uint64]),
    _i1.FieldInfo(
        name: 'f7',
        index: 72,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int8, _i1.FieldValueType.int8]),
    _i1.FieldInfo(
        name: 'f8',
        index: 73,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int8, _i1.FieldValueType.int16]),
    _i1.FieldInfo(
        name: 'f9',
        index: 74,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int8, _i1.FieldValueType.int32]),
    _i1.FieldInfo(
        name: 'f10',
        index: 75,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int8, _i1.FieldValueType.int64]),
    _i1.FieldInfo(
        name: 'f11',
        index: 76,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int8, _i1.FieldValueType.float32]),
    _i1.FieldInfo(
        name: 'f12',
        index: 77,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int8, _i1.FieldValueType.float64]),
    _i1.FieldInfo(
        name: 'g1',
        index: 79,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int16, _i1.FieldValueType.boolean]),
    _i1.FieldInfo(
        name: 'g2',
        index: 80,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int16, _i1.FieldValueType.string]),
    _i1.FieldInfo(
        name: 'g3',
        index: 81,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int16, _i1.FieldValueType.uint8]),
    _i1.FieldInfo(
        name: 'g4',
        index: 82,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int16, _i1.FieldValueType.uint16]),
    _i1.FieldInfo(
        name: 'g5',
        index: 83,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int16, _i1.FieldValueType.uint32]),
    _i1.FieldInfo(
        name: 'g6',
        index: 84,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int16, _i1.FieldValueType.uint64]),
    _i1.FieldInfo(
        name: 'g7',
        index: 85,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int16, _i1.FieldValueType.int8]),
    _i1.FieldInfo(
        name: 'g8',
        index: 86,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int16, _i1.FieldValueType.int16]),
    _i1.FieldInfo(
        name: 'g9',
        index: 87,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int16, _i1.FieldValueType.int32]),
    _i1.FieldInfo(
        name: 'g10',
        index: 88,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int16, _i1.FieldValueType.int64]),
    _i1.FieldInfo(
        name: 'g11',
        index: 89,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int16, _i1.FieldValueType.float32]),
    _i1.FieldInfo(
        name: 'g12',
        index: 90,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int16, _i1.FieldValueType.float64]),
    _i1.FieldInfo(
        name: 'h1',
        index: 92,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int32, _i1.FieldValueType.boolean]),
    _i1.FieldInfo(
        name: 'h2',
        index: 93,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int32, _i1.FieldValueType.string]),
    _i1.FieldInfo(
        name: 'h3',
        index: 94,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int32, _i1.FieldValueType.uint8]),
    _i1.FieldInfo(
        name: 'h4',
        index: 95,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int32, _i1.FieldValueType.uint16]),
    _i1.FieldInfo(
        name: 'h5',
        index: 96,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int32, _i1.FieldValueType.uint32]),
    _i1.FieldInfo(
        name: 'h6',
        index: 97,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int32, _i1.FieldValueType.uint64]),
    _i1.FieldInfo(
        name: 'h7',
        index: 98,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int32, _i1.FieldValueType.int8]),
    _i1.FieldInfo(
        name: 'h8',
        index: 99,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int32, _i1.FieldValueType.int16]),
    _i1.FieldInfo(
        name: 'h9',
        index: 100,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int32, _i1.FieldValueType.int32]),
    _i1.FieldInfo(
        name: 'h10',
        index: 101,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int32, _i1.FieldValueType.int64]),
    _i1.FieldInfo(
        name: 'h11',
        index: 102,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int32, _i1.FieldValueType.float32]),
    _i1.FieldInfo(
        name: 'h12',
        index: 103,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int32, _i1.FieldValueType.float64]),
    _i1.FieldInfo(
        name: 'i1',
        index: 105,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int64, _i1.FieldValueType.boolean]),
    _i1.FieldInfo(
        name: 'i2',
        index: 106,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int64, _i1.FieldValueType.string]),
    _i1.FieldInfo(
        name: 'i3',
        index: 107,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int64, _i1.FieldValueType.uint8]),
    _i1.FieldInfo(
        name: 'i4',
        index: 108,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int64, _i1.FieldValueType.uint16]),
    _i1.FieldInfo(
        name: 'i5',
        index: 109,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int64, _i1.FieldValueType.uint32]),
    _i1.FieldInfo(
        name: 'i6',
        index: 110,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int64, _i1.FieldValueType.uint64]),
    _i1.FieldInfo(
        name: 'i7',
        index: 111,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int64, _i1.FieldValueType.int8]),
    _i1.FieldInfo(
        name: 'i8',
        index: 112,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int64, _i1.FieldValueType.int16]),
    _i1.FieldInfo(
        name: 'i9',
        index: 113,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int64, _i1.FieldValueType.int32]),
    _i1.FieldInfo(
        name: 'i10',
        index: 114,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int64, _i1.FieldValueType.int64]),
    _i1.FieldInfo(
        name: 'i11',
        index: 115,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int64, _i1.FieldValueType.float32]),
    _i1.FieldInfo(
        name: 'i12',
        index: 116,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.int64, _i1.FieldValueType.float64]),
    _i1.FieldInfo(
        name: 'j1',
        index: 118,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float32, _i1.FieldValueType.boolean]),
    _i1.FieldInfo(
        name: 'j2',
        index: 119,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float32, _i1.FieldValueType.string]),
    _i1.FieldInfo(
        name: 'j3',
        index: 120,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float32, _i1.FieldValueType.uint8]),
    _i1.FieldInfo(
        name: 'j4',
        index: 121,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float32, _i1.FieldValueType.uint16]),
    _i1.FieldInfo(
        name: 'j5',
        index: 122,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float32, _i1.FieldValueType.uint32]),
    _i1.FieldInfo(
        name: 'j6',
        index: 123,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float32, _i1.FieldValueType.uint64]),
    _i1.FieldInfo(
        name: 'j7',
        index: 124,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float32, _i1.FieldValueType.int8]),
    _i1.FieldInfo(
        name: 'j8',
        index: 125,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float32, _i1.FieldValueType.int16]),
    _i1.FieldInfo(
        name: 'j9',
        index: 126,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float32, _i1.FieldValueType.int32]),
    _i1.FieldInfo(
        name: 'j10',
        index: 127,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float32, _i1.FieldValueType.int64]),
    _i1.FieldInfo(
        name: 'j11',
        index: 128,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float32, _i1.FieldValueType.float32]),
    _i1.FieldInfo(
        name: 'j12',
        index: 129,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float32, _i1.FieldValueType.float64]),
    _i1.FieldInfo(
        name: 'k1',
        index: 131,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float64, _i1.FieldValueType.boolean]),
    _i1.FieldInfo(
        name: 'k2',
        index: 132,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float64, _i1.FieldValueType.string]),
    _i1.FieldInfo(
        name: 'k3',
        index: 133,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float64, _i1.FieldValueType.uint8]),
    _i1.FieldInfo(
        name: 'k4',
        index: 134,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float64, _i1.FieldValueType.uint16]),
    _i1.FieldInfo(
        name: 'k5',
        index: 135,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float64, _i1.FieldValueType.uint32]),
    _i1.FieldInfo(
        name: 'k6',
        index: 136,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float64, _i1.FieldValueType.uint64]),
    _i1.FieldInfo(
        name: 'k7',
        index: 137,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float64, _i1.FieldValueType.int8]),
    _i1.FieldInfo(
        name: 'k8',
        index: 138,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float64, _i1.FieldValueType.int16]),
    _i1.FieldInfo(
        name: 'k9',
        index: 139,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float64, _i1.FieldValueType.int32]),
    _i1.FieldInfo(
        name: 'k10',
        index: 140,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float64, _i1.FieldValueType.int64]),
    _i1.FieldInfo(
        name: 'k11',
        index: 141,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float64, _i1.FieldValueType.float32]),
    _i1.FieldInfo(
        name: 'k12',
        index: 142,
        nullable: false,
        valueType: _i1.FieldValueType.map,
        typeArguments: [_i1.FieldValueType.float64, _i1.FieldValueType.float64]),
  ];

  static final _defaults = <_i1.DefaultValueGetter>[
    (args) => <String, bool>{},
    (args) => <String, String>{},
    (args) => <String, int>{},
    (args) => <String, int>{},
    (args) => <String, int>{},
    (args) => <String, BigInt>{},
    (args) => <String, int>{},
    (args) => <String, int>{},
    (args) => <String, int>{},
    (args) => <String, int>{},
    (args) => <String, double>{},
    (args) => <String, double>{},
    (args) => <int, bool>{},
    (args) => <int, String>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, BigInt>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, double>{},
    (args) => <int, double>{},
    (args) => <int, bool>{},
    (args) => <int, String>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, BigInt>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, double>{},
    (args) => <int, double>{},
    (args) => <int, bool>{},
    (args) => <int, String>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, BigInt>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, double>{},
    (args) => <int, double>{},
    (args) => <BigInt, bool>{},
    (args) => <BigInt, String>{},
    (args) => <BigInt, int>{},
    (args) => <BigInt, int>{},
    (args) => <BigInt, int>{},
    (args) => <BigInt, BigInt>{},
    (args) => <BigInt, int>{},
    (args) => <BigInt, int>{},
    (args) => <BigInt, int>{},
    (args) => <BigInt, int>{},
    (args) => <BigInt, double>{},
    (args) => <BigInt, double>{},
    (args) => <int, bool>{},
    (args) => <int, String>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, BigInt>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, double>{},
    (args) => <int, double>{},
    (args) => <int, bool>{},
    (args) => <int, String>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, BigInt>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, double>{},
    (args) => <int, double>{},
    (args) => <int, bool>{},
    (args) => <int, String>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, BigInt>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, double>{},
    (args) => <int, double>{},
    (args) => <int, bool>{},
    (args) => <int, String>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, BigInt>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, int>{},
    (args) => <int, double>{},
    (args) => <int, double>{},
    (args) => <double, bool>{},
    (args) => <double, String>{},
    (args) => <double, int>{},
    (args) => <double, int>{},
    (args) => <double, int>{},
    (args) => <double, BigInt>{},
    (args) => <double, int>{},
    (args) => <double, int>{},
    (args) => <double, int>{},
    (args) => <double, int>{},
    (args) => <double, double>{},
    (args) => <double, double>{},
    (args) => <double, bool>{},
    (args) => <double, String>{},
    (args) => <double, int>{},
    (args) => <double, int>{},
    (args) => <double, int>{},
    (args) => <double, BigInt>{},
    (args) => <double, int>{},
    (args) => <double, int>{},
    (args) => <double, int>{},
    (args) => <double, int>{},
    (args) => <double, double>{},
    (args) => <double, double>{},
  ];

  final _schema = _i1.SchemaStructDefinition<Default>(_fieldset, 132, _defaults);

  late final _i1.StructHandler<Default> _handler;

  Map<String, bool> get a1 => _handler.getValue(1);
  set a1(Map<String, bool> value) => _handler.setMap(1, value);
  Map<String, String> get a2 => _handler.getValue(2);
  set a2(Map<String, String> value) => _handler.setMap(2, value);
  Map<String, int> get a3 => _handler.getValue(3);
  set a3(Map<String, int> value) => _handler.setMap(3, value);
  Map<String, int> get a4 => _handler.getValue(4);
  set a4(Map<String, int> value) => _handler.setMap(4, value);
  Map<String, int> get a5 => _handler.getValue(5);
  set a5(Map<String, int> value) => _handler.setMap(5, value);
  Map<String, BigInt> get a6 => _handler.getValue(6);
  set a6(Map<String, BigInt> value) => _handler.setMap(6, value);
  Map<String, int> get a7 => _handler.getValue(7);
  set a7(Map<String, int> value) => _handler.setMap(7, value);
  Map<String, int> get a8 => _handler.getValue(8);
  set a8(Map<String, int> value) => _handler.setMap(8, value);
  Map<String, int> get a9 => _handler.getValue(9);
  set a9(Map<String, int> value) => _handler.setMap(9, value);
  Map<String, int> get a10 => _handler.getValue(10);
  set a10(Map<String, int> value) => _handler.setMap(10, value);
  Map<String, double> get a11 => _handler.getValue(11);
  set a11(Map<String, double> value) => _handler.setMap(11, value);
  Map<String, double> get a12 => _handler.getValue(12);
  set a12(Map<String, double> value) => _handler.setMap(12, value);
  Map<int, bool> get b1 => _handler.getValue(14);
  set b1(Map<int, bool> value) => _handler.setMap(14, value);
  Map<int, String> get b2 => _handler.getValue(15);
  set b2(Map<int, String> value) => _handler.setMap(15, value);
  Map<int, int> get b3 => _handler.getValue(16);
  set b3(Map<int, int> value) => _handler.setMap(16, value);
  Map<int, int> get b4 => _handler.getValue(17);
  set b4(Map<int, int> value) => _handler.setMap(17, value);
  Map<int, int> get b5 => _handler.getValue(18);
  set b5(Map<int, int> value) => _handler.setMap(18, value);
  Map<int, BigInt> get b6 => _handler.getValue(19);
  set b6(Map<int, BigInt> value) => _handler.setMap(19, value);
  Map<int, int> get b7 => _handler.getValue(20);
  set b7(Map<int, int> value) => _handler.setMap(20, value);
  Map<int, int> get b8 => _handler.getValue(21);
  set b8(Map<int, int> value) => _handler.setMap(21, value);
  Map<int, int> get b9 => _handler.getValue(22);
  set b9(Map<int, int> value) => _handler.setMap(22, value);
  Map<int, int> get b10 => _handler.getValue(23);
  set b10(Map<int, int> value) => _handler.setMap(23, value);
  Map<int, double> get b11 => _handler.getValue(24);
  set b11(Map<int, double> value) => _handler.setMap(24, value);
  Map<int, double> get b12 => _handler.getValue(25);
  set b12(Map<int, double> value) => _handler.setMap(25, value);
  Map<int, bool> get c1 => _handler.getValue(27);
  set c1(Map<int, bool> value) => _handler.setMap(27, value);
  Map<int, String> get c2 => _handler.getValue(28);
  set c2(Map<int, String> value) => _handler.setMap(28, value);
  Map<int, int> get c3 => _handler.getValue(29);
  set c3(Map<int, int> value) => _handler.setMap(29, value);
  Map<int, int> get c4 => _handler.getValue(30);
  set c4(Map<int, int> value) => _handler.setMap(30, value);
  Map<int, int> get c5 => _handler.getValue(31);
  set c5(Map<int, int> value) => _handler.setMap(31, value);
  Map<int, BigInt> get c6 => _handler.getValue(32);
  set c6(Map<int, BigInt> value) => _handler.setMap(32, value);
  Map<int, int> get c7 => _handler.getValue(33);
  set c7(Map<int, int> value) => _handler.setMap(33, value);
  Map<int, int> get c8 => _handler.getValue(34);
  set c8(Map<int, int> value) => _handler.setMap(34, value);
  Map<int, int> get c9 => _handler.getValue(35);
  set c9(Map<int, int> value) => _handler.setMap(35, value);
  Map<int, int> get c10 => _handler.getValue(36);
  set c10(Map<int, int> value) => _handler.setMap(36, value);
  Map<int, double> get c11 => _handler.getValue(37);
  set c11(Map<int, double> value) => _handler.setMap(37, value);
  Map<int, double> get c12 => _handler.getValue(38);
  set c12(Map<int, double> value) => _handler.setMap(38, value);
  Map<int, bool> get d1 => _handler.getValue(40);
  set d1(Map<int, bool> value) => _handler.setMap(40, value);
  Map<int, String> get d2 => _handler.getValue(41);
  set d2(Map<int, String> value) => _handler.setMap(41, value);
  Map<int, int> get d3 => _handler.getValue(42);
  set d3(Map<int, int> value) => _handler.setMap(42, value);
  Map<int, int> get d4 => _handler.getValue(43);
  set d4(Map<int, int> value) => _handler.setMap(43, value);
  Map<int, int> get d5 => _handler.getValue(44);
  set d5(Map<int, int> value) => _handler.setMap(44, value);
  Map<int, BigInt> get d6 => _handler.getValue(45);
  set d6(Map<int, BigInt> value) => _handler.setMap(45, value);
  Map<int, int> get d7 => _handler.getValue(46);
  set d7(Map<int, int> value) => _handler.setMap(46, value);
  Map<int, int> get d8 => _handler.getValue(47);
  set d8(Map<int, int> value) => _handler.setMap(47, value);
  Map<int, int> get d9 => _handler.getValue(48);
  set d9(Map<int, int> value) => _handler.setMap(48, value);
  Map<int, int> get d10 => _handler.getValue(49);
  set d10(Map<int, int> value) => _handler.setMap(49, value);
  Map<int, double> get d11 => _handler.getValue(50);
  set d11(Map<int, double> value) => _handler.setMap(50, value);
  Map<int, double> get d12 => _handler.getValue(51);
  set d12(Map<int, double> value) => _handler.setMap(51, value);
  Map<BigInt, bool> get e1 => _handler.getValue(53);
  set e1(Map<BigInt, bool> value) => _handler.setMap(53, value);
  Map<BigInt, String> get e2 => _handler.getValue(54);
  set e2(Map<BigInt, String> value) => _handler.setMap(54, value);
  Map<BigInt, int> get e3 => _handler.getValue(55);
  set e3(Map<BigInt, int> value) => _handler.setMap(55, value);
  Map<BigInt, int> get e4 => _handler.getValue(56);
  set e4(Map<BigInt, int> value) => _handler.setMap(56, value);
  Map<BigInt, int> get e5 => _handler.getValue(57);
  set e5(Map<BigInt, int> value) => _handler.setMap(57, value);
  Map<BigInt, BigInt> get e6 => _handler.getValue(58);
  set e6(Map<BigInt, BigInt> value) => _handler.setMap(58, value);
  Map<BigInt, int> get e7 => _handler.getValue(59);
  set e7(Map<BigInt, int> value) => _handler.setMap(59, value);
  Map<BigInt, int> get e8 => _handler.getValue(60);
  set e8(Map<BigInt, int> value) => _handler.setMap(60, value);
  Map<BigInt, int> get e9 => _handler.getValue(61);
  set e9(Map<BigInt, int> value) => _handler.setMap(61, value);
  Map<BigInt, int> get e10 => _handler.getValue(62);
  set e10(Map<BigInt, int> value) => _handler.setMap(62, value);
  Map<BigInt, double> get e11 => _handler.getValue(63);
  set e11(Map<BigInt, double> value) => _handler.setMap(63, value);
  Map<BigInt, double> get e12 => _handler.getValue(64);
  set e12(Map<BigInt, double> value) => _handler.setMap(64, value);
  Map<int, bool> get f1 => _handler.getValue(66);
  set f1(Map<int, bool> value) => _handler.setMap(66, value);
  Map<int, String> get f2 => _handler.getValue(67);
  set f2(Map<int, String> value) => _handler.setMap(67, value);
  Map<int, int> get f3 => _handler.getValue(68);
  set f3(Map<int, int> value) => _handler.setMap(68, value);
  Map<int, int> get f4 => _handler.getValue(69);
  set f4(Map<int, int> value) => _handler.setMap(69, value);
  Map<int, int> get f5 => _handler.getValue(70);
  set f5(Map<int, int> value) => _handler.setMap(70, value);
  Map<int, BigInt> get f6 => _handler.getValue(71);
  set f6(Map<int, BigInt> value) => _handler.setMap(71, value);
  Map<int, int> get f7 => _handler.getValue(72);
  set f7(Map<int, int> value) => _handler.setMap(72, value);
  Map<int, int> get f8 => _handler.getValue(73);
  set f8(Map<int, int> value) => _handler.setMap(73, value);
  Map<int, int> get f9 => _handler.getValue(74);
  set f9(Map<int, int> value) => _handler.setMap(74, value);
  Map<int, int> get f10 => _handler.getValue(75);
  set f10(Map<int, int> value) => _handler.setMap(75, value);
  Map<int, double> get f11 => _handler.getValue(76);
  set f11(Map<int, double> value) => _handler.setMap(76, value);
  Map<int, double> get f12 => _handler.getValue(77);
  set f12(Map<int, double> value) => _handler.setMap(77, value);
  Map<int, bool> get g1 => _handler.getValue(79);
  set g1(Map<int, bool> value) => _handler.setMap(79, value);
  Map<int, String> get g2 => _handler.getValue(80);
  set g2(Map<int, String> value) => _handler.setMap(80, value);
  Map<int, int> get g3 => _handler.getValue(81);
  set g3(Map<int, int> value) => _handler.setMap(81, value);
  Map<int, int> get g4 => _handler.getValue(82);
  set g4(Map<int, int> value) => _handler.setMap(82, value);
  Map<int, int> get g5 => _handler.getValue(83);
  set g5(Map<int, int> value) => _handler.setMap(83, value);
  Map<int, BigInt> get g6 => _handler.getValue(84);
  set g6(Map<int, BigInt> value) => _handler.setMap(84, value);
  Map<int, int> get g7 => _handler.getValue(85);
  set g7(Map<int, int> value) => _handler.setMap(85, value);
  Map<int, int> get g8 => _handler.getValue(86);
  set g8(Map<int, int> value) => _handler.setMap(86, value);
  Map<int, int> get g9 => _handler.getValue(87);
  set g9(Map<int, int> value) => _handler.setMap(87, value);
  Map<int, int> get g10 => _handler.getValue(88);
  set g10(Map<int, int> value) => _handler.setMap(88, value);
  Map<int, double> get g11 => _handler.getValue(89);
  set g11(Map<int, double> value) => _handler.setMap(89, value);
  Map<int, double> get g12 => _handler.getValue(90);
  set g12(Map<int, double> value) => _handler.setMap(90, value);
  Map<int, bool> get h1 => _handler.getValue(92);
  set h1(Map<int, bool> value) => _handler.setMap(92, value);
  Map<int, String> get h2 => _handler.getValue(93);
  set h2(Map<int, String> value) => _handler.setMap(93, value);
  Map<int, int> get h3 => _handler.getValue(94);
  set h3(Map<int, int> value) => _handler.setMap(94, value);
  Map<int, int> get h4 => _handler.getValue(95);
  set h4(Map<int, int> value) => _handler.setMap(95, value);
  Map<int, int> get h5 => _handler.getValue(96);
  set h5(Map<int, int> value) => _handler.setMap(96, value);
  Map<int, BigInt> get h6 => _handler.getValue(97);
  set h6(Map<int, BigInt> value) => _handler.setMap(97, value);
  Map<int, int> get h7 => _handler.getValue(98);
  set h7(Map<int, int> value) => _handler.setMap(98, value);
  Map<int, int> get h8 => _handler.getValue(99);
  set h8(Map<int, int> value) => _handler.setMap(99, value);
  Map<int, int> get h9 => _handler.getValue(100);
  set h9(Map<int, int> value) => _handler.setMap(100, value);
  Map<int, int> get h10 => _handler.getValue(101);
  set h10(Map<int, int> value) => _handler.setMap(101, value);
  Map<int, double> get h11 => _handler.getValue(102);
  set h11(Map<int, double> value) => _handler.setMap(102, value);
  Map<int, double> get h12 => _handler.getValue(103);
  set h12(Map<int, double> value) => _handler.setMap(103, value);
  Map<int, bool> get i1 => _handler.getValue(105);
  set i1(Map<int, bool> value) => _handler.setMap(105, value);
  Map<int, String> get i2 => _handler.getValue(106);
  set i2(Map<int, String> value) => _handler.setMap(106, value);
  Map<int, int> get i3 => _handler.getValue(107);
  set i3(Map<int, int> value) => _handler.setMap(107, value);
  Map<int, int> get i4 => _handler.getValue(108);
  set i4(Map<int, int> value) => _handler.setMap(108, value);
  Map<int, int> get i5 => _handler.getValue(109);
  set i5(Map<int, int> value) => _handler.setMap(109, value);
  Map<int, BigInt> get i6 => _handler.getValue(110);
  set i6(Map<int, BigInt> value) => _handler.setMap(110, value);
  Map<int, int> get i7 => _handler.getValue(111);
  set i7(Map<int, int> value) => _handler.setMap(111, value);
  Map<int, int> get i8 => _handler.getValue(112);
  set i8(Map<int, int> value) => _handler.setMap(112, value);
  Map<int, int> get i9 => _handler.getValue(113);
  set i9(Map<int, int> value) => _handler.setMap(113, value);
  Map<int, int> get i10 => _handler.getValue(114);
  set i10(Map<int, int> value) => _handler.setMap(114, value);
  Map<int, double> get i11 => _handler.getValue(115);
  set i11(Map<int, double> value) => _handler.setMap(115, value);
  Map<int, double> get i12 => _handler.getValue(116);
  set i12(Map<int, double> value) => _handler.setMap(116, value);
  Map<double, bool> get j1 => _handler.getValue(118);
  set j1(Map<double, bool> value) => _handler.setMap(118, value);
  Map<double, String> get j2 => _handler.getValue(119);
  set j2(Map<double, String> value) => _handler.setMap(119, value);
  Map<double, int> get j3 => _handler.getValue(120);
  set j3(Map<double, int> value) => _handler.setMap(120, value);
  Map<double, int> get j4 => _handler.getValue(121);
  set j4(Map<double, int> value) => _handler.setMap(121, value);
  Map<double, int> get j5 => _handler.getValue(122);
  set j5(Map<double, int> value) => _handler.setMap(122, value);
  Map<double, BigInt> get j6 => _handler.getValue(123);
  set j6(Map<double, BigInt> value) => _handler.setMap(123, value);
  Map<double, int> get j7 => _handler.getValue(124);
  set j7(Map<double, int> value) => _handler.setMap(124, value);
  Map<double, int> get j8 => _handler.getValue(125);
  set j8(Map<double, int> value) => _handler.setMap(125, value);
  Map<double, int> get j9 => _handler.getValue(126);
  set j9(Map<double, int> value) => _handler.setMap(126, value);
  Map<double, int> get j10 => _handler.getValue(127);
  set j10(Map<double, int> value) => _handler.setMap(127, value);
  Map<double, double> get j11 => _handler.getValue(128);
  set j11(Map<double, double> value) => _handler.setMap(128, value);
  Map<double, double> get j12 => _handler.getValue(129);
  set j12(Map<double, double> value) => _handler.setMap(129, value);
  Map<double, bool> get k1 => _handler.getValue(131);
  set k1(Map<double, bool> value) => _handler.setMap(131, value);
  Map<double, String> get k2 => _handler.getValue(132);
  set k2(Map<double, String> value) => _handler.setMap(132, value);
  Map<double, int> get k3 => _handler.getValue(133);
  set k3(Map<double, int> value) => _handler.setMap(133, value);
  Map<double, int> get k4 => _handler.getValue(134);
  set k4(Map<double, int> value) => _handler.setMap(134, value);
  Map<double, int> get k5 => _handler.getValue(135);
  set k5(Map<double, int> value) => _handler.setMap(135, value);
  Map<double, BigInt> get k6 => _handler.getValue(136);
  set k6(Map<double, BigInt> value) => _handler.setMap(136, value);
  Map<double, int> get k7 => _handler.getValue(137);
  set k7(Map<double, int> value) => _handler.setMap(137, value);
  Map<double, int> get k8 => _handler.getValue(138);
  set k8(Map<double, int> value) => _handler.setMap(138, value);
  Map<double, int> get k9 => _handler.getValue(139);
  set k9(Map<double, int> value) => _handler.setMap(139, value);
  Map<double, int> get k10 => _handler.getValue(140);
  set k10(Map<double, int> value) => _handler.setMap(140, value);
  Map<double, double> get k11 => _handler.getValue(141);
  set k11(Map<double, double> value) => _handler.setMap(141, value);
  Map<double, double> get k12 => _handler.getValue(142);
  set k12(Map<double, double> value) => _handler.setMap(142, value);
  @override
  int get hashCode => _handler.getHash(() => Object.hashAll([
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
        b1,
        b2,
        b3,
        b4,
        b5,
        b6,
        b7,
        b8,
        b9,
        b10,
        b11,
        b12,
        c1,
        c2,
        c3,
        c4,
        c5,
        c6,
        c7,
        c8,
        c9,
        c10,
        c11,
        c12,
        d1,
        d2,
        d3,
        d4,
        d5,
        d6,
        d7,
        d8,
        d9,
        d10,
        d11,
        d12,
        e1,
        e2,
        e3,
        e4,
        e5,
        e6,
        e7,
        e8,
        e9,
        e10,
        e11,
        e12,
        f1,
        f2,
        f3,
        f4,
        f5,
        f6,
        f7,
        f8,
        f9,
        f10,
        f11,
        f12,
        g1,
        g2,
        g3,
        g4,
        g5,
        g6,
        g7,
        g8,
        g9,
        g10,
        g11,
        g12,
        h1,
        h2,
        h3,
        h4,
        h5,
        h6,
        h7,
        h8,
        h9,
        h10,
        h11,
        h12,
        i1,
        i2,
        i3,
        i4,
        i5,
        i6,
        i7,
        i8,
        i9,
        i10,
        i11,
        i12,
        j1,
        j2,
        j3,
        j4,
        j5,
        j6,
        j7,
        j8,
        j9,
        j10,
        j11,
        j12,
        k1,
        k2,
        k3,
        k4,
        k5,
        k6,
        k7,
        k8,
        k9,
        k10,
        k11,
        k12
      ]));
  @override
  bool operator ==(Object other) {
    if (other is! Default) {
      return false;
    }

    return _i1.kDeepCollectionEquality.equals(a1, other.a1) &&
        _i1.kDeepCollectionEquality.equals(a2, other.a2) &&
        _i1.kDeepCollectionEquality.equals(a3, other.a3) &&
        _i1.kDeepCollectionEquality.equals(a4, other.a4) &&
        _i1.kDeepCollectionEquality.equals(a5, other.a5) &&
        _i1.kDeepCollectionEquality.equals(a6, other.a6) &&
        _i1.kDeepCollectionEquality.equals(a7, other.a7) &&
        _i1.kDeepCollectionEquality.equals(a8, other.a8) &&
        _i1.kDeepCollectionEquality.equals(a9, other.a9) &&
        _i1.kDeepCollectionEquality.equals(a10, other.a10) &&
        _i1.kDeepCollectionEquality.equals(a11, other.a11) &&
        _i1.kDeepCollectionEquality.equals(a12, other.a12) &&
        _i1.kDeepCollectionEquality.equals(b1, other.b1) &&
        _i1.kDeepCollectionEquality.equals(b2, other.b2) &&
        _i1.kDeepCollectionEquality.equals(b3, other.b3) &&
        _i1.kDeepCollectionEquality.equals(b4, other.b4) &&
        _i1.kDeepCollectionEquality.equals(b5, other.b5) &&
        _i1.kDeepCollectionEquality.equals(b6, other.b6) &&
        _i1.kDeepCollectionEquality.equals(b7, other.b7) &&
        _i1.kDeepCollectionEquality.equals(b8, other.b8) &&
        _i1.kDeepCollectionEquality.equals(b9, other.b9) &&
        _i1.kDeepCollectionEquality.equals(b10, other.b10) &&
        _i1.kDeepCollectionEquality.equals(b11, other.b11) &&
        _i1.kDeepCollectionEquality.equals(b12, other.b12) &&
        _i1.kDeepCollectionEquality.equals(c1, other.c1) &&
        _i1.kDeepCollectionEquality.equals(c2, other.c2) &&
        _i1.kDeepCollectionEquality.equals(c3, other.c3) &&
        _i1.kDeepCollectionEquality.equals(c4, other.c4) &&
        _i1.kDeepCollectionEquality.equals(c5, other.c5) &&
        _i1.kDeepCollectionEquality.equals(c6, other.c6) &&
        _i1.kDeepCollectionEquality.equals(c7, other.c7) &&
        _i1.kDeepCollectionEquality.equals(c8, other.c8) &&
        _i1.kDeepCollectionEquality.equals(c9, other.c9) &&
        _i1.kDeepCollectionEquality.equals(c10, other.c10) &&
        _i1.kDeepCollectionEquality.equals(c11, other.c11) &&
        _i1.kDeepCollectionEquality.equals(c12, other.c12) &&
        _i1.kDeepCollectionEquality.equals(d1, other.d1) &&
        _i1.kDeepCollectionEquality.equals(d2, other.d2) &&
        _i1.kDeepCollectionEquality.equals(d3, other.d3) &&
        _i1.kDeepCollectionEquality.equals(d4, other.d4) &&
        _i1.kDeepCollectionEquality.equals(d5, other.d5) &&
        _i1.kDeepCollectionEquality.equals(d6, other.d6) &&
        _i1.kDeepCollectionEquality.equals(d7, other.d7) &&
        _i1.kDeepCollectionEquality.equals(d8, other.d8) &&
        _i1.kDeepCollectionEquality.equals(d9, other.d9) &&
        _i1.kDeepCollectionEquality.equals(d10, other.d10) &&
        _i1.kDeepCollectionEquality.equals(d11, other.d11) &&
        _i1.kDeepCollectionEquality.equals(d12, other.d12) &&
        _i1.kDeepCollectionEquality.equals(e1, other.e1) &&
        _i1.kDeepCollectionEquality.equals(e2, other.e2) &&
        _i1.kDeepCollectionEquality.equals(e3, other.e3) &&
        _i1.kDeepCollectionEquality.equals(e4, other.e4) &&
        _i1.kDeepCollectionEquality.equals(e5, other.e5) &&
        _i1.kDeepCollectionEquality.equals(e6, other.e6) &&
        _i1.kDeepCollectionEquality.equals(e7, other.e7) &&
        _i1.kDeepCollectionEquality.equals(e8, other.e8) &&
        _i1.kDeepCollectionEquality.equals(e9, other.e9) &&
        _i1.kDeepCollectionEquality.equals(e10, other.e10) &&
        _i1.kDeepCollectionEquality.equals(e11, other.e11) &&
        _i1.kDeepCollectionEquality.equals(e12, other.e12) &&
        _i1.kDeepCollectionEquality.equals(f1, other.f1) &&
        _i1.kDeepCollectionEquality.equals(f2, other.f2) &&
        _i1.kDeepCollectionEquality.equals(f3, other.f3) &&
        _i1.kDeepCollectionEquality.equals(f4, other.f4) &&
        _i1.kDeepCollectionEquality.equals(f5, other.f5) &&
        _i1.kDeepCollectionEquality.equals(f6, other.f6) &&
        _i1.kDeepCollectionEquality.equals(f7, other.f7) &&
        _i1.kDeepCollectionEquality.equals(f8, other.f8) &&
        _i1.kDeepCollectionEquality.equals(f9, other.f9) &&
        _i1.kDeepCollectionEquality.equals(f10, other.f10) &&
        _i1.kDeepCollectionEquality.equals(f11, other.f11) &&
        _i1.kDeepCollectionEquality.equals(f12, other.f12) &&
        _i1.kDeepCollectionEquality.equals(g1, other.g1) &&
        _i1.kDeepCollectionEquality.equals(g2, other.g2) &&
        _i1.kDeepCollectionEquality.equals(g3, other.g3) &&
        _i1.kDeepCollectionEquality.equals(g4, other.g4) &&
        _i1.kDeepCollectionEquality.equals(g5, other.g5) &&
        _i1.kDeepCollectionEquality.equals(g6, other.g6) &&
        _i1.kDeepCollectionEquality.equals(g7, other.g7) &&
        _i1.kDeepCollectionEquality.equals(g8, other.g8) &&
        _i1.kDeepCollectionEquality.equals(g9, other.g9) &&
        _i1.kDeepCollectionEquality.equals(g10, other.g10) &&
        _i1.kDeepCollectionEquality.equals(g11, other.g11) &&
        _i1.kDeepCollectionEquality.equals(g12, other.g12) &&
        _i1.kDeepCollectionEquality.equals(h1, other.h1) &&
        _i1.kDeepCollectionEquality.equals(h2, other.h2) &&
        _i1.kDeepCollectionEquality.equals(h3, other.h3) &&
        _i1.kDeepCollectionEquality.equals(h4, other.h4) &&
        _i1.kDeepCollectionEquality.equals(h5, other.h5) &&
        _i1.kDeepCollectionEquality.equals(h6, other.h6) &&
        _i1.kDeepCollectionEquality.equals(h7, other.h7) &&
        _i1.kDeepCollectionEquality.equals(h8, other.h8) &&
        _i1.kDeepCollectionEquality.equals(h9, other.h9) &&
        _i1.kDeepCollectionEquality.equals(h10, other.h10) &&
        _i1.kDeepCollectionEquality.equals(h11, other.h11) &&
        _i1.kDeepCollectionEquality.equals(h12, other.h12) &&
        _i1.kDeepCollectionEquality.equals(i1, other.i1) &&
        _i1.kDeepCollectionEquality.equals(i2, other.i2) &&
        _i1.kDeepCollectionEquality.equals(i3, other.i3) &&
        _i1.kDeepCollectionEquality.equals(i4, other.i4) &&
        _i1.kDeepCollectionEquality.equals(i5, other.i5) &&
        _i1.kDeepCollectionEquality.equals(i6, other.i6) &&
        _i1.kDeepCollectionEquality.equals(i7, other.i7) &&
        _i1.kDeepCollectionEquality.equals(i8, other.i8) &&
        _i1.kDeepCollectionEquality.equals(i9, other.i9) &&
        _i1.kDeepCollectionEquality.equals(i10, other.i10) &&
        _i1.kDeepCollectionEquality.equals(i11, other.i11) &&
        _i1.kDeepCollectionEquality.equals(i12, other.i12) &&
        _i1.kDeepCollectionEquality.equals(j1, other.j1) &&
        _i1.kDeepCollectionEquality.equals(j2, other.j2) &&
        _i1.kDeepCollectionEquality.equals(j3, other.j3) &&
        _i1.kDeepCollectionEquality.equals(j4, other.j4) &&
        _i1.kDeepCollectionEquality.equals(j5, other.j5) &&
        _i1.kDeepCollectionEquality.equals(j6, other.j6) &&
        _i1.kDeepCollectionEquality.equals(j7, other.j7) &&
        _i1.kDeepCollectionEquality.equals(j8, other.j8) &&
        _i1.kDeepCollectionEquality.equals(j9, other.j9) &&
        _i1.kDeepCollectionEquality.equals(j10, other.j10) &&
        _i1.kDeepCollectionEquality.equals(j11, other.j11) &&
        _i1.kDeepCollectionEquality.equals(j12, other.j12) &&
        _i1.kDeepCollectionEquality.equals(k1, other.k1) &&
        _i1.kDeepCollectionEquality.equals(k2, other.k2) &&
        _i1.kDeepCollectionEquality.equals(k3, other.k3) &&
        _i1.kDeepCollectionEquality.equals(k4, other.k4) &&
        _i1.kDeepCollectionEquality.equals(k5, other.k5) &&
        _i1.kDeepCollectionEquality.equals(k6, other.k6) &&
        _i1.kDeepCollectionEquality.equals(k7, other.k7) &&
        _i1.kDeepCollectionEquality.equals(k8, other.k8) &&
        _i1.kDeepCollectionEquality.equals(k9, other.k9) &&
        _i1.kDeepCollectionEquality.equals(k10, other.k10) &&
        _i1.kDeepCollectionEquality.equals(k11, other.k11) &&
        _i1.kDeepCollectionEquality.equals(k12, other.k12);
  }

  @override
  String toString() =>
      'a1($a1) a2($a2) a3($a3) a4($a4) a5($a5) a6($a6) a7($a7) a8($a8) a9($a9) a10($a10) a11($a11) a12($a12) b1($b1) b2($b2) b3($b3) b4($b4) b5($b5) b6($b6) b7($b7) b8($b8) b9($b9) b10($b10) b11($b11) b12($b12) c1($c1) c2($c2) c3($c3) c4($c4) c5($c5) c6($c6) c7($c7) c8($c8) c9($c9) c10($c10) c11($c11) c12($c12) d1($d1) d2($d2) d3($d3) d4($d4) d5($d5) d6($d6) d7($d7) d8($d8) d9($d9) d10($d10) d11($d11) d12($d12) e1($e1) e2($e2) e3($e3) e4($e4) e5($e5) e6($e6) e7($e7) e8($e8) e9($e9) e10($e10) e11($e11) e12($e12) f1($f1) f2($f2) f3($f3) f4($f4) f5($f5) f6($f6) f7($f7) f8($f8) f9($f9) f10($f10) f11($f11) f12($f12) g1($g1) g2($g2) g3($g3) g4($g4) g5($g5) g6($g6) g7($g7) g8($g8) g9($g9) g10($g10) g11($g11) g12($g12) h1($h1) h2($h2) h3($h3) h4($h4) h5($h5) h6($h6) h7($h7) h8($h8) h9($h9) h10($h10) h11($h11) h12($h12) i1($i1) i2($i2) i3($i3) i4($i4) i5($i5) i6($i6) i7($i7) i8($i8) i9($i9) i10($i10) i11($i11) i12($i12) j1($j1) j2($j2) j3($j3) j4($j4) j5($j5) j6($j6) j7($j7) j8($j8) j9($j9) j10($j10) j11($j11) j12($j12) k1($k1) k2($k2) k3($k3) k4($k4) k5($k5) k6($k6) k7($k7) k8($k8) k9($k9) k10($k10) k11($k11) k12($k12)';
  @override
  Default clone() {
    var newInstance = Default._();
    newInstance.mergeUsing(this);

    return newInstance;
  }

  @override
  _i2.Uint8List serialize() => _handler.getBuffer();
  @override
  void mergeFrom(_i2.Uint8List buffer) => _handler.merge(buffer);
  @override
  void mergeUsing(Default other) => _handler.mergeUsing(other._handler);
  static Default fromBuffer(_i2.Uint8List buffer) {
    var instance = Default._();
    instance.mergeFrom(buffer);

    return instance;
  }
}
