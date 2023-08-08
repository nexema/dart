import 'dart:convert';
import 'dart:io';

import 'package:nexema_generator/generator/generator.dart';
import 'package:nexema_generator/models.dart';

Future<void> main(List<String> args) async {
  String? input;

  // If snapshot file is specified (dev-only), parse it
  // if(arguments["snapshot-file"] != null) {
  //   input = File(arguments["snapshot-file"]).readAsStringSync();
  // } else {
  input = stdin.readLineSync(encoding: utf8);
  if (input == null) {
    throw "empty content";
  }
  // }

  // Parse definition
  var snapshot = NexemaSnapshot.fromJson(input);

  // verify arguments
  if (args.isEmpty) {
    _reportError("output-path argument is mandatory.");
    return;
  }

  // Create generator and execute
  var generator = Generator(
      snapshot: snapshot,
      settings: GeneratorSettings(outputPath: args.first, projectName: args.last));

  final result = generator.run();
  stdout.writeln(result.toJson());
  stdout.flush();
}

void _reportError(String msg) {
  stdout.writeln(msg);
  stdout.flush();
}
