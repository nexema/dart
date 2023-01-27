

import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:nexema_generator/generator.dart';
import 'package:nexema_generator/models.dart';

Future<void> main(List<String> args) async {
  var parser = ArgParser()
    ..addOption("snapshot-file")
    ..addOption("output-path");
  var arguments = parser.parse(args);

  String? input;

  // If snapshot file is specified (dev-only), parse it
  if(arguments["snapshot-file"] != null) {
    input = File(arguments["snapshot-file"]).readAsStringSync();
  } else {
    input = stdin.readLineSync(encoding: utf8);
    if(input == null) {
      throw "empty content";
    }
  }

  // Parse definition
  var definition = NexemaDefinition.fromJson(input);

  // verify arguments
  if(!arguments.wasParsed("output-path")) {
    _reportError("output-path argument is mandatory.");
    return;
  }

  // Create generator and execute
  var generator = Generator(
    definition: definition, 
    settings: GeneratorSettings(
      outputPath: arguments["output-path"]
    )
  );

  generator.generate();
}

void _reportError(String msg) {
  stdout.writeln(msg);
  stdout.flush();
}