// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:nexema/messagepack_schema.dart' as _i1;

class Default extends _i1.SchemaStruct<Default> {
  Default._() {
    _handler = _i1.StructHandler<Default>(_schema);
  }

  factory Default({
    bool a = false,
    String b = '',
    int c = 0,
    int d = 0,
    int e = 0,
    BigInt? f,
    int g = 0,
    int h = 0,
    int i = 0,
    int j = 0,
    double k = 0.0,
    double l = 0.0,
    _i2.Uint8List? m,
    List<bool> n = const [],
    List<String> o = const [],
    List<int> p = const [],
    List<int> q = const [],
    List<int> r = const [],
    List<BigInt> s = const [],
    List<int> t = const [],
    List<int> u = const [],
    List<int> v = const [],
    List<int> w = const [],
    List<double> x = const [],
    List<double> y = const [],
  }) {
    var instance = Default._();
    instance._schema.setFields([
      a,
      b,
      c,
      d,
      e,
      f ?? BigInt.zero,
      g,
      h,
      i,
      j,
      k,
      l,
      m ?? _i2.Uint8List.fromList(const []),
      n,
      o,
      p,
      q,
      r,
      s,
      t,
      u,
      v,
      w,
      x,
      y,
    ]);
    return instance;
  }

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
    _i1.FieldInfo(
        name: 'n',
        index: 14,
        nullable: false,
        valueType: _i1.FieldValueType.list,
        typeArguments: [_i1.FieldValueType.boolean]),
    _i1.FieldInfo(
        name: 'o',
        index: 15,
        nullable: false,
        valueType: _i1.FieldValueType.list,
        typeArguments: [_i1.FieldValueType.string]),
    _i1.FieldInfo(
        name: 'p',
        index: 16,
        nullable: false,
        valueType: _i1.FieldValueType.list,
        typeArguments: [_i1.FieldValueType.uint8]),
    _i1.FieldInfo(
        name: 'q',
        index: 17,
        nullable: false,
        valueType: _i1.FieldValueType.list,
        typeArguments: [_i1.FieldValueType.uint16]),
    _i1.FieldInfo(
        name: 'r',
        index: 18,
        nullable: false,
        valueType: _i1.FieldValueType.list,
        typeArguments: [_i1.FieldValueType.uint32]),
    _i1.FieldInfo(
        name: 's',
        index: 19,
        nullable: false,
        valueType: _i1.FieldValueType.list,
        typeArguments: [_i1.FieldValueType.uint64]),
    _i1.FieldInfo(
        name: 't',
        index: 20,
        nullable: false,
        valueType: _i1.FieldValueType.list,
        typeArguments: [_i1.FieldValueType.int8]),
    _i1.FieldInfo(
        name: 'u',
        index: 21,
        nullable: false,
        valueType: _i1.FieldValueType.list,
        typeArguments: [_i1.FieldValueType.int16]),
    _i1.FieldInfo(
        name: 'v',
        index: 22,
        nullable: false,
        valueType: _i1.FieldValueType.list,
        typeArguments: [_i1.FieldValueType.int32]),
    _i1.FieldInfo(
        name: 'w',
        index: 23,
        nullable: false,
        valueType: _i1.FieldValueType.list,
        typeArguments: [_i1.FieldValueType.int64]),
    _i1.FieldInfo(
        name: 'x',
        index: 24,
        nullable: false,
        valueType: _i1.FieldValueType.list,
        typeArguments: [_i1.FieldValueType.float32]),
    _i1.FieldInfo(
        name: 'y',
        index: 25,
        nullable: false,
        valueType: _i1.FieldValueType.list,
        typeArguments: [_i1.FieldValueType.float64]),
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
    (args) => <String>[],
    (args) => <int>[],
    (args) => <int>[],
    (args) => <int>[],
    (args) => <BigInt>[],
    (args) => <int>[],
    (args) => <int>[],
    (args) => <int>[],
    (args) => <int>[],
    (args) => <double>[],
    (args) => <double>[],
  ];

  final _schema = _i1.SchemaStructDefinition<Default>(_fieldset, 25, _defaults);

  late final _i1.StructHandler<Default> _handler;

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
  List<bool> get n => _handler.getValue(14);
  set n(List<bool> value) => _handler.setList(14, value);
  List<String> get o => _handler.getValue(15);
  set o(List<String> value) => _handler.setList(15, value);
  List<int> get p => _handler.getValue(16);
  set p(List<int> value) => _handler.setList(16, value);
  List<int> get q => _handler.getValue(17);
  set q(List<int> value) => _handler.setList(17, value);
  List<int> get r => _handler.getValue(18);
  set r(List<int> value) => _handler.setList(18, value);
  List<BigInt> get s => _handler.getValue(19);
  set s(List<BigInt> value) => _handler.setList(19, value);
  List<int> get t => _handler.getValue(20);
  set t(List<int> value) => _handler.setList(20, value);
  List<int> get u => _handler.getValue(21);
  set u(List<int> value) => _handler.setList(21, value);
  List<int> get v => _handler.getValue(22);
  set v(List<int> value) => _handler.setList(22, value);
  List<int> get w => _handler.getValue(23);
  set w(List<int> value) => _handler.setList(23, value);
  List<double> get x => _handler.getValue(24);
  set x(List<double> value) => _handler.setList(24, value);
  List<double> get y => _handler.getValue(25);
  set y(List<double> value) => _handler.setList(25, value);
  @override
  int get hashCode => _handler.getHash(() =>
      Object.hashAll([a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y]));
  @override
  bool operator ==(Object other) {
    if (other is! Default) {
      return false;
    }

    return a == other.a &&
        b == other.b &&
        c == other.c &&
        d == other.d &&
        e == other.e &&
        f == other.f &&
        g == other.g &&
        h == other.h &&
        i == other.i &&
        j == other.j &&
        k == other.k &&
        l == other.l &&
        m == other.m &&
        _i1.kDeepCollectionEquality.equals(n, other.n) &&
        _i1.kDeepCollectionEquality.equals(o, other.o) &&
        _i1.kDeepCollectionEquality.equals(p, other.p) &&
        _i1.kDeepCollectionEquality.equals(q, other.q) &&
        _i1.kDeepCollectionEquality.equals(r, other.r) &&
        _i1.kDeepCollectionEquality.equals(s, other.s) &&
        _i1.kDeepCollectionEquality.equals(t, other.t) &&
        _i1.kDeepCollectionEquality.equals(u, other.u) &&
        _i1.kDeepCollectionEquality.equals(v, other.v) &&
        _i1.kDeepCollectionEquality.equals(w, other.w) &&
        _i1.kDeepCollectionEquality.equals(x, other.x) &&
        _i1.kDeepCollectionEquality.equals(y, other.y);
  }

  @override
  String toString() =>
      'a($a) b($b) c($c) d($d) e($e) f($f) g($g) h($h) i($i) j($j) k($k) l($l) m($m) n($n) o($o) p($p) q($q) r($r) s($s) t($t) u($u) v($v) w($w) x($x) y($y)';
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
