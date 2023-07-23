// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:typed_data';

import 'package:nexema/nexema.dart';
import 'package:nexema/src/constants/numbers.dart';
import 'package:test/test.dart';

import 'testcase.dart';

void main() {
  group("Nexemab encode/decode", () {
    group("encode", () {
      var testcases = TestCaseRunner(<TestCase<void Function(NexemabWriter), List<int>>>[
        TestCase("true", (writer) => writer.encodeBool(true), [0x01]),
        TestCase("false", (writer) => writer.encodeBool(false), [0x00]),
        TestCase("null", (writer) => writer.encodeNull(), [0xc0]),
        TestCase("uint8(12)", (writer) => writer.encodeUint8(12), [0x0c]),
        TestCase("uint8(${Numbers.uint8MaxValue})",
            (writer) => writer.encodeUint8(Numbers.uint8MaxValue), [255]),
        TestCase("uint8(0)", (writer) => writer.encodeUint8(Numbers.uint8MinValue), [0]),
        TestCase("uint16(${Numbers.uint16MaxValue})",
            (writer) => writer.encodeUint16(Numbers.uint16MaxValue), [255, 255]),
        TestCase("uint16(${Numbers.uint16MinValue})",
            (writer) => writer.encodeUint16(Numbers.uint16MinValue), [0, 0]),
        TestCase("uint32(${Numbers.uint32MaxValue})",
            (writer) => writer.encodeUint32(Numbers.uint32MaxValue), [255, 255, 255, 255]),
        TestCase("uint32(${Numbers.uint32MinValue})",
            (writer) => writer.encodeUint32(Numbers.uint32MinValue), [0, 0, 0, 0]),
        TestCase("int8(12)", (writer) => writer.encodeInt8(12), [0x0c]),
        TestCase("int8(-12)", (writer) => writer.encodeUint8(12), [0xc]),
        TestCase("int8(${Numbers.int8MaxValue})",
            (writer) => writer.encodeInt8(Numbers.int8MaxValue), [127]),
        TestCase("int8(${Numbers.int8MinValue})",
            (writer) => writer.encodeInt8(Numbers.int8MinValue), [128]),
        TestCase("int16(${Numbers.int16MaxValue})",
            (writer) => writer.encodeInt16(Numbers.int16MaxValue), [127, 255]),
        TestCase("int16(${Numbers.int16MinValue})",
            (writer) => writer.encodeInt16(Numbers.int16MinValue), [128, 0]),
        TestCase("int32(${Numbers.int32MaxValue})",
            (writer) => writer.encodeInt32(Numbers.int32MaxValue), [127, 255, 255, 255]),
        TestCase("int32(${Numbers.int32MinValue})",
            (writer) => writer.encodeInt32(Numbers.int32MinValue), [128, 0, 0, 0]),
        TestCase("varint(1)", (writer) => writer.encodeVarint(1), [2]),
        TestCase("varint(267)", (writer) => writer.encodeVarint(267), [150, 4]),
        TestCase("varint(392)", (writer) => writer.encodeVarint(392), [144, 6]),
        TestCase("varint(59992)", (writer) => writer.encodeVarint(59992), [176, 169, 7]),
        TestCase("varint(${Numbers.uint32MaxValue})",
            (writer) => writer.encodeVarint(Numbers.uint32MaxValue), [254, 255, 255, 255, 31]),
        TestCase("varint(${Numbers.int32MaxValue})",
            (writer) => writer.encodeVarint(Numbers.int32MaxValue), [254, 255, 255, 255, 15]),
        TestCase("varint(maxint64)", (writer) => writer.encodeVarint(Numbers.int64MaxValue),
            [0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x1]),
        TestCase("uint64(maxuint64)", (writer) => writer.encodeUint64(Numbers.uint64MaxValue),
            [0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff]),
        TestCase(
            "uint64(maxuint64-25513)",
            (writer) => writer.encodeUint64(Numbers.uint64MaxValue - BigInt.from(25513)),
            [0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x9c, 0x56]),
        TestCase("int64(maxint64)", (writer) => writer.encodeInt64(Numbers.int64MaxValue),
            [0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff]),
        TestCase("int64(minint64)", (writer) => writer.encodeInt64(Numbers.int64MinValue),
            [128, 0, 0, 0, 0, 0, 0, 0]),
        TestCase(
            "bigint_int64(maxuint64)",
            (writer) => writer.encodeInt64AsBigInt(Numbers.int64MaxValueBigInt),
            [0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff]),
        TestCase("float32(max)", (writer) => writer.encodeFloat32(Numbers.float32MaxValue),
            [0x7f, 0x7f, 0xff, 0xff]),
        TestCase("float32(min)", (writer) => writer.encodeFloat32(Numbers.float32MinValue),
            [0x0, 0x0, 0x0, 0x1]),
        TestCase("float32(23.4324)", (writer) => writer.encodeFloat32(23.4324),
            [0x41, 0xbb, 0x75, 0x8e]),
        TestCase("float64(max)", (writer) => writer.encodeFloat64(Numbers.float64MaxValue),
            [0x7f, 0xef, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff]),
        TestCase("float64(min)", (writer) => writer.encodeFloat64(Numbers.float64MinValue),
            [0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1]),
        TestCase("string(hello world)", (writer) => writer.encodeString("hello world"),
            [0x16, 0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0x77, 0x6f, 0x72, 0x6c, 0x64]),
        TestCase("string(<ŇTź՗YƙHc)", (writer) => writer.encodeString("<ŇTź՗YƙHc"), [
          0x1e,
          0x3c,
          0xc2,
          0x95,
          0xc5,
          0x87,
          0x54,
          0xc5,
          0xba,
          0xd5,
          0x97,
          0x59,
          0xc6,
          0x99,
          0x48,
          0x63
        ]),
        TestCase(
            "binary",
            (writer) => writer.encodeBinary(Uint8List.fromList([25, 20, 23, 11, 23, 11, 77])),
            [0xe, 0x19, 0x14, 0x17, 0xb, 0x17, 0xb, 0x4d]),
        TestCase(
            "list(varint x5)",
            (writer) => writer
                .beginArray(5)
                .encodeVarint(13241)
                .encodeVarint(1231413)
                .encodeVarint(5)
                .encodeVarint(998989)
                .encodeVarint(1129928),
            [
              0xdc,
              0xa,
              0xf2,
              0xce,
              0x1,
              0xea,
              0xa8,
              0x96,
              0x1,
              0xa,
              0x9a,
              0xf9,
              0x79,
              0x90,
              0xf7,
              0x89,
              0x1
            ]),
        TestCase(
            "map(string,float32 x3)",
            (writer) => writer
                .beginMap(3)
                .encodeString("abc")
                .encodeFloat32(213141.24125123)
                .encodeString("v")
                .encodeFloat32(-4314.34123)
                .encodeString("9928910sad")
                .encodeFloat32(-3224.99980989078489378),
            [
              0xdf,
              0x6,
              0x6,
              0x61,
              0x62,
              0x63,
              0x48,
              0x50,
              0x25,
              0x4f,
              0x2,
              0x76,
              0xc5,
              0x86,
              0xd2,
              0xbb,
              0x14,
              0x39,
              0x39,
              0x32,
              0x38,
              0x39,
              0x31,
              0x30,
              0x73,
              0x61,
              0x64,
              0xc5,
              0x49,
              0x8f,
              0xff
            ]),
        TestCase(
            "encodeUvarint throws out of bounds",
            (writer) => writer.encodeUvarint(BigInt.from(-124)),
            [],
            FormatError("uvarint value must be greater than or equals to 0.")),
        TestCase(
            "encodeInt8 throws out of bounds",
            (writer) => writer.encodeInt8(Numbers.int8MaxValue + 1),
            [],
            FormatError("int8 value must be less than or equals to ${Numbers.int8MaxValue}.")),
        TestCase(
            "encodeInt8 throws out of bounds negative",
            (writer) => writer.encodeInt8(Numbers.int8MinValue - 1),
            [],
            FormatError("int8 value must be greater than or equals to ${Numbers.int8MinValue}.")),
        TestCase(
            "encodeInt16 throws out of bounds",
            (writer) => writer.encodeInt16(Numbers.int16MaxValue + 1),
            [],
            FormatError("int16 value must be less than or equals to ${Numbers.int16MaxValue}.")),
        TestCase(
            "encodeInt16 throws out of bounds negative",
            (writer) => writer.encodeInt16(Numbers.int16MinValue - 1),
            [],
            FormatError("int16 value must be greater than or equals to ${Numbers.int16MinValue}.")),
        TestCase(
            "encodeInt32 throws out of bounds",
            (writer) => writer.encodeInt32(Numbers.int32MaxValue + 1),
            [],
            FormatError("int32 value must be less than or equals to ${Numbers.int32MaxValue}.")),
        TestCase(
            "encodeInt32 throws out of bounds negative",
            (writer) => writer.encodeInt32(Numbers.int32MinValue - 1),
            [],
            FormatError("int32 value must be greater than or equals to ${Numbers.int32MinValue}.")),
        TestCase(
            "encodeBigInt64 throws out of bounds",
            (writer) => writer.encodeInt64AsBigInt(Numbers.int64MaxValueBigInt + BigInt.one),
            [],
            FormatError("int64 value must be less than or equals to ${Numbers.int64MaxValue}.")),
        TestCase(
            "encodeBigInt64 throws out of bounds negative",
            (writer) => writer.encodeInt64AsBigInt(Numbers.int64MinValueBigInt - BigInt.one),
            [],
            FormatError("int64 value must be greater than or equals to ${Numbers.int64MinValue}.")),
        TestCase(
            "encodeUint8 throws out of bounds",
            (writer) => writer.encodeUint8(Numbers.uint8MaxValue + 1),
            [],
            FormatError("uint8 value must be less than or equals to ${Numbers.uint8MaxValue}.")),
        TestCase(
            "encodeUint8 throws out of bounds negative",
            (writer) => writer.encodeUint8(Numbers.uint8MinValue - 1),
            [],
            FormatError("uint8 value must be greater than or equals to 0.")),
        TestCase(
            "encodeUint16 throws out of bounds",
            (writer) => writer.encodeUint16(Numbers.uint16MaxValue + 1),
            [],
            FormatError("uint16 value must be less than or equals to ${Numbers.uint16MaxValue}.")),
        TestCase(
            "encodeUint16 throws out of bounds negative",
            (writer) => writer.encodeUint16(Numbers.uint16MinValue - 1),
            [],
            FormatError("uint16 value must be greater than or equals to 0.")),
        TestCase(
            "encodeUint32 throws out of bounds",
            (writer) => writer.encodeUint32(Numbers.uint32MaxValue + 1),
            [],
            FormatError("uint32 value must be less than or equals to ${Numbers.uint32MaxValue}.")),
        TestCase(
            "encodeUint32 throws out of bounds negative",
            (writer) => writer.encodeUint32(Numbers.uint32MinValue - 1),
            [],
            FormatError("uint32 value must be greater than or equals to 0.")),
        TestCase(
            "encodeUint64 throws out of bounds",
            (writer) => writer.encodeUint64(Numbers.uint64MaxValue + BigInt.one),
            [],
            FormatError("uint64 value must be less than or equals to ${Numbers.uint64MaxValue}.")),
        TestCase(
            "encodeUint64 throws out of bounds negative",
            (writer) => writer.encodeUint64(-BigInt.one),
            [],
            FormatError("uint64 value must be greater than or equals to 0.")),
        TestCase(
            "encodeTimestamp('2023/3/2 15:32')",
            (writer) => writer.encodeTimestamp(DateTime(2023, 3, 2, 15, 32)),
            [128, 128, 226, 130, 139, 241, 214, 200, 46]),
        TestCase(
            "encodeDuration(225252ms)",
            (writer) => writer.encodeDuration(const Duration(milliseconds: 225252)),
            [128, 132, 134, 161, 142, 13]),
      ]);
      testcases.run((testcase) {
        NexemabWriter writer = NexemabWriter();
        if (testcase.error != null) {
          try {
            testcase.input(writer);
          } catch (err) {
            expect(err, equals(testcase.error));
          }
        } else {
          expect(() => testcase.input(writer), isNot(throwsA(isA<Error>())));
        }
        expect(writer.takeBytes(), equals(Uint8List.fromList(testcase.expect)));
      });

      test("internal buffer should resize successfuly if not big as needed", () {
        var writer = NexemabWriter(1);
        writer.encodeString("Hello world!");
        writer.encodeInt32(1924890125);
        writer.encodeFloat32(123124.125125123);
        writer.encodeBinary(Uint8List.fromList([123, 123, 54, 43, 11]));
        var buffer = writer.takeBytes();
        expect(
            buffer,
            equals(Uint8List.fromList([
              0x18,
              0x48,
              0x65,
              0x6c,
              0x6c,
              0x6f,
              0x20,
              0x77,
              0x6f,
              0x72,
              0x6c,
              0x64,
              0x21,
              0x72,
              0xbb,
              0x7e,
              0xd,
              0x47,
              0xf0,
              0x7a,
              0x10,
              0xa,
              0x7b,
              0x7b,
              0x36,
              0x2b,
              0xb
            ])));
      });
    });

    group("decode primitives", () {
      // input: [[input binary], decode method]
      var testcases = TestCaseRunner(<TestCase<List<dynamic>, dynamic>>[
        TestCase(
            "true",
            [
              [0x01],
              (NexemabReader decoder) => decoder.decodeBool()
            ],
            true),
        TestCase(
            "false",
            [
              [0x00],
              (NexemabReader decoder) => decoder.decodeBool()
            ],
            false),
        TestCase(
            "isNextNull",
            [
              [0xc0],
              (NexemabReader decoder) => decoder.isNextNull()
            ],
            true),
        TestCase(
            "isNextNull returns false if not null",
            [
              [0x5],
              (NexemabReader decoder) => decoder.isNextNull()
            ],
            false),
        TestCase(
            "uvarint(1)",
            [
              [1],
              (NexemabReader decoder) => decoder.decodeUvarint()
            ],
            BigInt.one),
        TestCase(
            "uvarint(1000)",
            [
              [232, 7],
              (NexemabReader decoder) => decoder.decodeUvarint()
            ],
            BigInt.from(1000)),
        TestCase(
            "uvarint(267)",
            [
              [139, 2],
              (NexemabReader decoder) => decoder.decodeUvarint()
            ],
            BigInt.from(267)),
        TestCase(
            "uvarint(59992)",
            [
              [216, 212, 3],
              (NexemabReader decoder) => decoder.decodeUvarint()
            ],
            BigInt.from(59992)),
        TestCase(
            "uvarint(maxuint32)",
            [
              [255, 255, 255, 255, 15],
              (NexemabReader decoder) => decoder.decodeUvarint()
            ],
            BigInt.from(Numbers.uint32MaxValue)),
        TestCase(
            "uvarint(maxuint64)",
            [
              [255, 255, 255, 255, 255, 255, 255, 255, 255, 1],
              (NexemabReader decoder) => decoder.decodeUvarint()
            ],
            Numbers.uint64MaxValue),
        TestCase(
            "uvarint(maxint64)",
            [
              [255, 255, 255, 255, 255, 255, 255, 255, 127],
              (NexemabReader decoder) => decoder.decodeUvarint()
            ],
            Numbers.int64MaxValueBigInt),
        TestCase(
            "uvarint(maxint64) with extra bytes",
            [
              [0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f, ..."adasd".codeUnits],
              (NexemabReader decoder) => decoder.decodeUvarint()
            ],
            Numbers.int64MaxValueBigInt),
        TestCase(
            "uvarint(1504) with extra bytes",
            [
              [224, 11, 2, ..."adasd".codeUnits],
              (NexemabReader decoder) => decoder.decodeUvarint()
            ],
            BigInt.from(1504)),
        TestCase(
            "uvarint(overflow) should overflow",
            [
              [255, 255, 255, 255, 255, 255, 255, 255, 255, 127],
              (NexemabReader decoder) => decoder.decodeUvarint()
            ],
            null,
            FormatError("uvarint overflow")),
        TestCase(
            "uvarint(overflow) should overflow 2",
            [
              [255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 127],
              (NexemabReader decoder) => decoder.decodeUvarint()
            ],
            null,
            FormatError("uvarint overflow")),
        TestCase(
            "varint(1)",
            [
              [2],
              (NexemabReader decoder) => decoder.decodeVarint()
            ],
            1),
        TestCase(
            "varint(267)",
            [
              [150, 4],
              (NexemabReader decoder) => decoder.decodeVarint()
            ],
            267),
        TestCase(
            "varint(392)",
            [
              [144, 6],
              (NexemabReader decoder) => decoder.decodeVarint()
            ],
            392),
        TestCase(
            "varint(59992)",
            [
              [176, 169, 7],
              (NexemabReader decoder) => decoder.decodeVarint()
            ],
            59992),
        TestCase(
            "varint(maxuint32)",
            [
              [0xfe, 0xff, 0xff, 0xff, 0x1f],
              (NexemabReader decoder) => decoder.decodeVarint()
            ],
            Numbers.uint32MaxValue),
        TestCase(
            "varint(maxint32)",
            [
              [0xfe, 0xff, 0xff, 0xff, 0xf],
              (NexemabReader decoder) => decoder.decodeVarint()
            ],
            Numbers.int32MaxValue),
        TestCase(
            "varint(maxint64)",
            [
              [0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x1],
              (NexemabReader decoder) => decoder.decodeVarint()
            ],
            Numbers.int64MaxValue),
        TestCase(
            "varint(maxint64) with extra bytes",
            [
              [
                0xfe,
                0xff,
                0xff,
                0xff,
                0xff,
                0xff,
                0xff,
                0xff,
                0xff,
                0x1,
                0x5,
                ..."hello".codeUnits
              ],
              (NexemabReader decoder) => decoder.decodeVarint()
            ],
            Numbers.int64MaxValue),
        TestCase(
            "string(hello world)",
            [
              [0x16, 0x68, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0x77, 0x6f, 0x72, 0x6c, 0x64],
              (NexemabReader decoder) => decoder.decodeString()
            ],
            "hello world"),
        TestCase(
            "string(<ŇTź՗YƙHc)",
            [
              [
                0x1e,
                0x3c,
                0xc2,
                0x95,
                0xc5,
                0x87,
                0x54,
                0xc5,
                0xba,
                0xd5,
                0x97,
                0x59,
                0xc6,
                0x99,
                0x48,
                0x63
              ],
              (NexemabReader decoder) => decoder.decodeString()
            ],
            "<ŇTź՗YƙHc"),
        TestCase(
            "int8(min)",
            [
              [128],
              (NexemabReader decoder) => decoder.decodeInt8()
            ],
            Numbers.int8MinValue),
        TestCase(
            "int8(max)",
            [
              [127],
              (NexemabReader decoder) => decoder.decodeInt8()
            ],
            Numbers.int8MaxValue),
        TestCase(
            "int16(min)",
            [
              [128, 0],
              (NexemabReader decoder) => decoder.decodeInt16()
            ],
            Numbers.int16MinValue),
        TestCase(
            "int16(max)",
            [
              [127, 255],
              (NexemabReader decoder) => decoder.decodeInt16()
            ],
            Numbers.int16MaxValue),
        TestCase(
            "int32(min)",
            [
              [128, 0, 0, 0],
              (NexemabReader decoder) => decoder.decodeInt32()
            ],
            Numbers.int32MinValue),
        TestCase(
            "int32(max)",
            [
              [127, 255, 255, 255],
              (NexemabReader decoder) => decoder.decodeInt32()
            ],
            Numbers.int32MaxValue),
        TestCase(
            "int64(min)",
            [
              [128, 0, 0, 0, 0, 0, 0, 0],
              (NexemabReader decoder) => decoder.decodeInt64()
            ],
            Numbers.int64MinValue),
        TestCase(
            "int64(max)",
            [
              [127, 255, 255, 255, 255, 255, 255, 255],
              (NexemabReader decoder) => decoder.decodeInt64()
            ],
            Numbers.int64MaxValue),
        TestCase(
            "int64AsBigInt(max)",
            [
              [127, 255, 255, 255, 255, 255, 255, 255],
              (NexemabReader decoder) => decoder.decodeInt64AsBigInt()
            ],
            Numbers.int64MaxValueBigInt),
        TestCase(
            "int64AsBigInt(min)",
            [
              [128, 0, 0, 0, 0, 0, 0, 0],
              (NexemabReader decoder) => decoder.decodeInt64AsBigInt()
            ],
            Numbers.int64MinValueBigInt),
        TestCase(
            "int64AsBigInt(24151241321)",
            [
              [0x0, 0x0, 0x0, 0x5, 0x9f, 0x86, 0xb2, 0x69],
              (NexemabReader decoder) => decoder.decodeInt64AsBigInt()
            ],
            BigInt.from(24151241321)),
        TestCase(
            "uint8(0)",
            [
              [0],
              (NexemabReader decoder) => decoder.decodeUint8()
            ],
            0),
        TestCase(
            "uint8(max)",
            [
              [255],
              (NexemabReader decoder) => decoder.decodeUint8()
            ],
            Numbers.uint8MaxValue),
        TestCase(
            "uint16(0)",
            [
              [0, 0],
              (NexemabReader decoder) => decoder.decodeInt16()
            ],
            0),
        TestCase(
            "uint16(max)",
            [
              [255, 255],
              (NexemabReader decoder) => decoder.decodeUint16()
            ],
            Numbers.uint16MaxValue),
        TestCase(
            "uint32(0)",
            [
              [0, 0, 0, 0],
              (NexemabReader decoder) => decoder.decodeUint32()
            ],
            0),
        TestCase(
            "uint32(max)",
            [
              [255, 255, 255, 255],
              (NexemabReader decoder) => decoder.decodeUint32()
            ],
            Numbers.uint32MaxValue),
        TestCase(
            "uint64(0)",
            [
              [0, 0, 0, 0, 0, 0, 0, 0],
              (NexemabReader decoder) => decoder.decodeUint64()
            ],
            BigInt.zero),
        TestCase(
            "uint64(max)",
            [
              [255, 255, 255, 255, 255, 255, 255, 255],
              (NexemabReader decoder) => decoder.decodeUint64()
            ],
            Numbers.uint64MaxValue),
        TestCase(
            "float32(max)",
            [
              [0x7f, 0x7f, 0xff, 0xff],
              (NexemabReader decoder) => decoder.decodeFloat32()
            ],
            Numbers.float32MaxValue),
        TestCase(
            "float32(min)",
            [
              [0x0, 0x0, 0x0, 0x1],
              (NexemabReader decoder) => decoder.decodeFloat32()
            ],
            Numbers.float32MinValue),
        TestCase(
            "float64(max)",
            [
              [0x7f, 0xef, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff],
              (NexemabReader decoder) => decoder.decodeFloat64()
            ],
            Numbers.float64MaxValue),
        TestCase(
            "float64(min)",
            [
              [0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1],
              (NexemabReader decoder) => decoder.decodeFloat64()
            ],
            Numbers.float64MinValue),
        TestCase(
            "binary",
            [
              [0xe, 0x19, 0x14, 0x17, 0xb, 0x17, 0xb, 0x4d],
              (NexemabReader decoder) => decoder.decodeBinary()
            ],
            Uint8List.fromList([25, 20, 23, 11, 23, 11, 77])),
        TestCase(
            "timestamp",
            [
              [128, 128, 226, 130, 139, 241, 214, 200, 46],
              (NexemabReader decoder) => decoder.decodeTimestamp()
            ],
            DateTime(2023, 3, 2, 15, 32)),
        TestCase(
            "duration",
            [
              [128, 132, 134, 161, 142, 13],
              (NexemabReader decoder) => decoder.decodeDuration()
            ],
            const Duration(milliseconds: 225252)),
        TestCase("list(string)", [
          [
            0xdc,
            0xa,
            0x8,
            0x68,
            0x6f,
            0x6c,
            0x61,
            0xa,
            0x68,
            0x65,
            0x6c,
            0x6c,
            0x6f,
            0xe,
            0x74,
            0x65,
            0x72,
            0x63,
            0x65,
            0x72,
            0x6f,
            0xa,
            0x74,
            0x68,
            0x69,
            0x72,
            0x64,
            0x6,
            0x62,
            0x79,
            0x65
          ],
          (NexemabReader decoder) =>
              List<String>.generate(decoder.beginDecodeArray(), (index) => decoder.decodeString())
        ], [
          "hola",
          "hello",
          "tercero",
          "third",
          "bye"
        ]),
        TestCase("map(string,varint)", [
          [
            0xdf,
            0x6,
            0x2,
            0x61,
            0x96,
            0xad,
            0x2f,
            0x2,
            0x62,
            0xc2,
            0xe,
            0x6,
            0x62,
            0x79,
            0x65,
            0xaa,
            0xa1,
            0xa0,
            0xc
          ],
          (NexemabReader decoder) => generateMap<String, int>(
              decoder.beginDecodeMap(), () => decoder.decodeString(), () => decoder.decodeVarint())
        ], {
          "a": 387915,
          "b": 929,
          "bye": 12847189
        }),
        TestCase(
            "list fails if not an array",
            [
              [
                0xdf,
                0x6,
                0x2,
                0x61,
                0x96,
                0xad,
                0x2f,
                0x2,
                0x62,
                0xc2,
                0xe,
                0x6,
                0x62,
                0x79,
                0x65,
                0xaa,
                0xa1,
                0xa0,
                0xc
              ],
              (NexemabReader decoder) => List<String>.generate(
                  decoder.beginDecodeArray(), (index) => decoder.decodeString())
            ],
            null,
            FormatError("not an array.")),
        TestCase(
            "map fails if not a map",
            [
              [
                0xdc,
                0xa,
                0x8,
                0x68,
                0x6f,
                0x6c,
                0x61,
                0xa,
                0x68,
                0x65,
                0x6c,
                0x6c,
                0x6f,
                0xe,
                0x74,
                0x65,
                0x72,
                0x63,
                0x65,
                0x72,
                0x6f,
                0xa,
                0x74,
                0x68,
                0x69,
                0x72,
                0x64,
                0x6,
                0x62,
                0x79,
                0x65
              ],
              (NexemabReader decoder) => generateMap<String, int>(decoder.beginDecodeMap(),
                  () => decoder.decodeString(), () => decoder.decodeVarint())
            ],
            null,
            FormatError("not a map."))
      ]);

      testcases.run((testcase) {
        var reader = NexemabReader(Uint8List.fromList(testcase.input[0]));
        dynamic result;
        if (testcase.error != null) {
          try {
            result = testcase.input[1](reader);
          } catch (err) {
            expect(err, equals(testcase.error));
          }
        } else {
          result = testcase.input[1](reader);
          // expect(() => result = testcase.input[1](reader), isNot(throwsA(isA<FormatError>())));
        }

        expect(result, equals(testcase.expect));
      });
    });

    test("isNextNull advances only if null", () {
      final reader = NexemabReader(Uint8List.fromList([0xc0, 0x01, 0x00])); // null, true, false
      expect(reader.isNextNull(), isTrue);
      expect(reader.decodeBool(), isTrue);
      expect(reader.decodeBool(), isFalse);
    });
  });
}

Map<K, V> generateMap<K, V>(int length, K Function() key, V Function() value) {
  var map = <K, V>{};
  for (int i = 0; i < length; i++) {
    map[key()] = value();
  }

  return map;
}
