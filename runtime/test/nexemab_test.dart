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
      var testcases = <TestCase<void Function(NexemabWriter), List<int>>>[
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
      ];

      testcases.forEach((element) {
        test(":- ${element.description} -> ${element.expect}", () {
          NexemabWriter writer = NexemabWriter();
          element.input(writer);
          expect(writer.takeBytes(), equals(Uint8List.fromList(element.expect)));
        }); 
      });
      
    });
  });
}