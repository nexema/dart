import 'dart:convert';
import 'dart:io';

import 'package:nexema_dart_generator/builder.dart';
import 'package:nexema_dart_generator/models.dart';
import 'package:nexema_dart_generator/utils/constants.dart';
import 'package:nexema_dart_generator/utils/logger.dart';

Future<void> main(List<String> args) async {
  bool debug = false;
  String? logPath;
  if(args.isNotEmpty && args.first == "--debug") {
    debug = true;
    logPath = args.last;
    await Logger.init(logPath);
  }

  int count = 0;
  while(true) {
    count++;
    Logger.log("checking for input. Attempt $count", logIf: debug);

    String? input;
    
    // readLine until the input string is read
    input = stdin.readLineSync(encoding: utf8);
    if(input == null || input.isEmpty) {
      if(kDebugMode) {
        input = kTestString;
      } else {
        continue;
      }
    }

    Logger.log("input read", logIf: debug);

    try {
      input = utf8.decode(base64.decode(input));
      var generateInput = GenerateInput.fromJson(jsonDecode(input));
      
      if(kDebugMode) {
        generateInput = generateInput.copyWith(outputPath: "example/lib/dtos");
      }

      Logger.log("generating code", logIf: debug);
      var builder = Builder(generateInput);
      builder.build();

      Logger.log("cleaning up... writing ok", logIf: debug);
      stdout.writeln("ok");
      break;
    } catch(err, stack) {
      print(err);
      print(stack);
      Logger.log("checking for input. Attempt $count", level: "ERROR", error: err, stackTrace: stack, logIf: debug);
    }
  }
}