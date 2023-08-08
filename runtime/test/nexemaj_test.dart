// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:typed_data';

import 'package:nexema/nexema.dart';
import 'package:nexema/src/constants/numbers.dart';
import 'package:test/test.dart';

import 'testcase.dart';

void main() {
  group("Nexemaj", () {
    test("Writer", () {
      final writer = NexemajWriter();
      writer.writeLbrace();
      writer.writeKey("my_string");
      writer.writeString(r'utf8: " \t Odފό̵ 哔');
      writer.writeKey("another");
      writer.writeBool(true);
      writer.writeKey("integer");
      writer.writeNumber(1231412312312);
      writer.writeKey("bigint");
      writer.writeBigIntAsString(Numbers.uint64MaxValue);
      writer.writeKey("my_array");
      writer.writeLbrack();
      writer.writeString("hola");
      writer.writeBool(true);
      writer.writeRbrack();
      writer.writeRbrace();
      var buffer = writer.takeBytes();
      expect(utf8.decode(buffer),
          r'{"my_string":"utf8: \" \\t Odފό̵ 哔","another":true,"integer":1231412312312,"bigint":"18446744073709551615","my_array":["hola",true]}');
    });

    group("Reader", () {
      var testcases = TestCaseRunner(<TestCase<List<dynamic>, dynamic>>[
        TestCase("36", ["36", (NexemajReader reader) => reader.readInt()], 36),
        TestCase("3.6", ["3.6", (NexemajReader reader) => reader.readFloat()], 3.6),
        TestCase("5.54e+56", ["5.54e+56", (NexemajReader reader) => reader.readFloat()], 5.54e+56),
      ]);
      testcases.run((testcase) {
        final reader = NexemajReader(utf8.encode(testcase.input[0]) as Uint8List);
        num result;
        if (testcase.error != null) {
          try {
            result = testcase.input[1](reader);
          } catch (err) {
            expect(err, equals(testcase.error));
          }
        } else {
          result = testcase.input[1](reader);
          expect(result, equals(testcase.expect));
        }
      });
    });

    test("Full read", () {
      final json = utf8.encode(
              '{"key":25,"key2":false,"key3":"hello world!","key4":5554.548784,"key5":"545418484684867864684168468","key6":[12, 2, 4],"key7":{"cats":true,"dogs":false},"key8":"aG9sYSBtdW5kbw==","key9":"2023-08-01T21:36:15.563","key10":"72h3m0.5s"}')
          as Uint8List;
      final typeInfo = <String, FieldValueKind>{
        "key": FieldValueKind.varint,
        "key2": FieldValueKind.bool,
        "key3": FieldValueKind.string,
        "key4": FieldValueKind.float32,
        "key5": FieldValueKind.int64,
        "key6": FieldValueKind.list,
        "key7": FieldValueKind.map,
        "key8": FieldValueKind.binary,
        "key9": FieldValueKind.timestamp,
        "key10": FieldValueKind.duration
      };

      final typeInfoArguments = <String, List<FieldValueKind>>{
        "key6": [FieldValueKind.varint],
        "key7": [FieldValueKind.string, FieldValueKind.bool]
      };
      final object = <String, dynamic>{};
      final reader = NexemajReader(json);
      reader.require(JsonType.object);
      while (reader.hasNextToken) {
        final key = reader.readObjectKey();

        // after reading the key, generated code will look up into the type's information to get the type value to read
        final valueType = typeInfo[key];
        if (valueType == null) {
          continue; // skip unknown keys
        }

        final value = reader.read(valueType, arguments: typeInfoArguments[key]);
        object[key] = value;
        reader.advance();
      }

      expect(
          object,
          equals({
            "key": 25,
            "key2": false,
            "key3": "hello world!",
            "key4": 5554.548784,
            "key5": BigInt.parse("545418484684867864684168468"),
            "key6": [12, 2, 4],
            "key7": {"cats": true, "dogs": false},
            "key8": base64.decode(base64.encode(utf8.encode("hola mundo"))),
            "key9": DateTime.parse("2023-08-01T21:36:15.563"),
            "key10": const Duration(hours: 72, minutes: 3, milliseconds: 500) // 72h3m0.5s
          }));
    });
  });
}
