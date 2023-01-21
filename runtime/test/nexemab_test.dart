// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:typed_data';

import 'package:nexema/src/constants/numbers.dart';
import 'package:nexema/src/encoder/spec.dart';
import 'package:nexema/src/encoder/writer.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

import 'testcase.dart';

void main() {
  group("Nexemab encode/decode", () {
    group("encode", () {
      // input: expected
      var testcases = TestCaseRunner(<TestCase<void Function(NexemabWriter), List<int>>>[
        TestCase("true", (writer) => writer.encodeBool(true), [kBoolTrue]),
        TestCase("false", (writer) => writer.encodeBool(false), [kBoolFalse]),
        TestCase("null", (writer) => writer.encodeNull(), [kNull]),
        TestCase("uint8(12)", (writer) => writer.encodeUint8(12), [0x0c]),
        TestCase("uint8(${Numbers.uint8MaxValue})", (writer) => writer.encodeUint8(Numbers.uint8MaxValue), [255]),
        TestCase("uint8(0)", (writer) => writer.encodeUint8(Numbers.uint8MinValue), [0]),
        TestCase("uint16(${Numbers.uint16MaxValue})", (writer) => writer.encodeUint16(Numbers.uint16MaxValue), [255, 255]),
        TestCase("uint16(${Numbers.uint16MinValue})", (writer) => writer.encodeUint16(Numbers.uint16MinValue), [0, 0]),
        TestCase("uint32(${Numbers.uint32MaxValue})", (writer) => writer.encodeUint32(Numbers.uint32MaxValue), [255, 255, 255, 255]),
        TestCase("uint32(${Numbers.uint32MinValue})", (writer) => writer.encodeUint32(Numbers.uint32MinValue), [0, 0, 0, 0]),
        TestCase("int8(12)", (writer) => writer.encodeInt8(12), [0x0c]),
        TestCase("int8(-12)", (writer) => writer.encodeUint8(12), [0xc]),
        TestCase("int8(${Numbers.int8MaxValue})", (writer) => writer.encodeInt8(Numbers.int8MaxValue), [127]),
        TestCase("int8(${Numbers.int8MinValue})", (writer) => writer.encodeInt8(Numbers.int8MinValue), [128]),
        TestCase("int16(${Numbers.int16MaxValue})", (writer) => writer.encodeInt16(Numbers.int16MaxValue), [127, 255]),
        TestCase("int16(${Numbers.int16MinValue})", (writer) => writer.encodeInt16(Numbers.int16MinValue), [128, 0]),
        TestCase("int32(${Numbers.int32MaxValue})", (writer) => writer.encodeInt32(Numbers.int32MaxValue), [127, 255, 255, 255]),
        TestCase("int32(${Numbers.int32MinValue})", (writer) => writer.encodeInt32(Numbers.int32MinValue), [128, 0, 0, 0]),
        TestCase("varint(1)", (writer) => writer.encodeVarint(1), [2]),
        TestCase("varint(267)", (writer) => writer.encodeVarint(267), [150, 4]),
        TestCase("varint(392)", (writer) => writer.encodeVarint(392), [144, 6]),
        TestCase("varint(59992)", (writer) => writer.encodeVarint(59992), [176, 169, 7]),
        TestCase("varint(${Numbers.uint32MaxValue})", (writer) => writer.encodeVarint(Numbers.uint32MaxValue), [254, 255, 255, 255, 31]),
        TestCase("varint(${Numbers.int32MaxValue})", (writer) => writer.encodeVarint(Numbers.int32MaxValue), [254, 255, 255, 255, 15]),
        TestCase("varint(maxint64)", (writer) => writer.encodeVarint(Numbers.int64MaxValue), [0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x1]),
        TestCase("uint64(maxuint64)", (writer) => writer.encodeUint64(Numbers.uint64MaxValue), [0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff]),
        TestCase("uint64(maxuint64-25513)", (writer) => writer.encodeUint64(Numbers.uint64MaxValue - BigInt.from(25513)), [0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x9c, 0x56]),
        TestCase("int64(maxuint64)", (writer) => writer.encodeInt64(Numbers.int64MaxValue), [0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff]),
        TestCase("bigint_int64(maxuint64)", (writer) => writer.encodeInt64AsBigInt(Numbers.int64MaxValueBigInt), [0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff]),
        TestCase("float32(max)", (writer) => writer.encodeFloat32(Numbers.float32MaxValue), [0x7f, 0x7f, 0xff, 0xff]),
        TestCase("float32(min)", (writer) => writer.encodeFloat32(Numbers.float32MinValue), [0x0, 0x0, 0x0, 0x1]),
        TestCase("float32(23.4324)", (writer) => writer.encodeFloat32(23.4324), [0x41, 0xbb, 0x75, 0x8e]),
        TestCase("float64(max)", (writer) => writer.encodeFloat64(Numbers.float64MaxValue), [0x7f, 0xef, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff]),
        TestCase("float64(min)", (writer) => writer.encodeFloat64(Numbers.float64MinValue), [0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1]),
        TestCase("string(hello world)", (writer) => writer.encodeString("hello world"), [0x16, 0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0x77, 0x6f, 0x72, 0x6c, 0x64]),
        TestCase("string(<ŇTź՗YƙHc)", (writer) => writer.encodeString("<ŇTź՗YƙHc"), [0x1e, 0x3c, 0xc2, 0x95, 0xc5, 0x87, 0x54, 0xc5, 0xba, 0xd5, 0x97, 0x59, 0xc6, 0x99, 0x48, 0x63]),
        TestCase("binary", (writer) => writer.encodeBinary(Uint8List.fromList([25, 20, 23, 11, 23, 11, 77])), [0xe, 0x19, 0x14, 0x17, 0xb, 0x17, 0xb, 0x4d]),
        TestCase("list(varint x5)", (writer) => writer.beginArray(5).encodeVarint(13241).encodeVarint(1231413).encodeVarint(5).encodeVarint(998989).encodeVarint(1129928), [0xdc, 0xa, 0xf2, 0xce, 0x1, 0xea, 0xa8, 0x96, 0x1, 0xa, 0x9a, 0xf9, 0x79, 0x90, 0xf7, 0x89, 0x1]),
        TestCase("map(string,float32 x3)", (writer) => writer.beginMap(3)
          .encodeString("abc").encodeFloat32(213141.24125123)
          .encodeString("v").encodeFloat32(-4314.34123)
          .encodeString("9928910sad").encodeFloat32(-3224.99980989078489378), [0xdf, 0x6, 0x6, 0x61, 0x62, 0x63, 0x48, 0x50, 0x25, 0x4f, 0x2, 0x76, 0xc5, 0x86, 0xd2, 0xbb, 0x14, 0x39, 0x39, 0x32, 0x38, 0x39, 0x31, 0x30, 0x73, 0x61, 0x64, 0xc5, 0x49, 0x8f, 0xff]),
      ]);
      testcases.run((testcase) { 
        NexemabWriter writer = NexemabWriter();
        testcase.input(writer);
        expect(writer.takeBytes(), equals(Uint8List.fromList(testcase.expect)));
      });
    });
  });
}