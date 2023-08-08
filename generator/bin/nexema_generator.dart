import 'dart:convert';
import 'dart:io';

import 'package:nexema_generator/generator/generator.dart';
import 'package:nexema_generator/models.dart';

void main(List<String> args) {
  String? input = stdin.readLineSync(encoding: utf8);
  if (input == null) {
    throw "empty content";
  }

  // Parse definition
  var snapshot = NexemaSnapshot.fromJson(input);

  final parsedArgs = Map.fromEntries(args
      .map((e) => e.split("="))
      .where((element) => element.length == 2)
      .map((e) => MapEntry(e[0], e[1])));

  // verify arguments
  final outputPath = parsedArgs["--output-path"];
  final projectName = parsedArgs["--project-name"];

  if (outputPath == null) {
    _reportError("--output-path argument is mandatory.");
    return;
  }

  if (projectName == null) {
    _reportError("--project-name argument is mandatory");
    return;
  }

  // Create generator and execute
  var generator = Generator(
      snapshot: snapshot,
      settings: GeneratorSettings(outputPath: outputPath, projectName: projectName));

  final result = generator.run();
  stdout.writeln(result.toJson());
  stdout.flush();
}

void _reportError(String msg) {
  stdout.writeln(msg);
  stdout.flush();
}
