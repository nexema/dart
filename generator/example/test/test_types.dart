import 'package:nexema/messagepack_schema.dart';
import 'package:test/test.dart';
import 'package:test_files/dtos/enum.mpack.dart';

void main() {
  test("Test enum creation", () {
    expect(EnumType.fromName("random1"), equals(EnumType.random1));
    expect(EnumType.valueOf(2), equals(EnumType.second));
    expect(EnumType.second, isNot(equals(EnumType.unknown)));
    expect(() => EnumType.valueOf(5), throwsA(isA<EnumNotFound>()));
    expect(() => EnumType.fromName("hello"), throwsA(isA<EnumNotFound>()));
  });
}