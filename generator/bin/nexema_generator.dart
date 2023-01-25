

import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:nexema_generator/generator.dart';
import 'package:nexema_generator/models.dart';

Future<void> main(List<String> args) async {
  var parser = ArgParser()..addOption("snapshot-file");
  var arguments = parser.parse(args);

  String? input;

  if(arguments["snapshot-file"] != null) {
    input = File(arguments["snapshot-file"]).readAsStringSync();
  } else {
    input = stdin.readLineSync(encoding: utf8);
    if(input == null) {
      throw "empty content";
    }
  }

  var definition = NexemaDefinition.fromJson(input);
  var generator = Generator(definition);
  generator.generate();
}