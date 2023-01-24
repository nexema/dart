

import 'dart:convert';
import 'dart:io';

import 'package:nexema_generator/generator.dart';
import 'package:nexema_generator/models.dart';

Future<void> main(List<String> args) async {
  String? input = stdin.readLineSync(encoding: utf8);
  if(input == null) {
    throw "empty content";
  }

  var definition = NexemaDefinition.fromJson(input);
  var generator = Generator(definition);
  generator.generate();
}