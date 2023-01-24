// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:nexema/nexema.dart';
import 'package:nexema/src/constants/numbers.dart';

void main() {
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
  print(utf8.decode(buffer));
}