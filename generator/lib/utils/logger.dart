import 'dart:io';
import 'package:path/path.dart' as p;

class Logger {
  static late IOSink _fileWriter;

  Logger._();

  static Future<void> init(String path) async {
    var file = File(p.join(path, "mpack_dart_generator.log"));
    await file.create(recursive: true);
    
    _fileWriter = file.openWrite(mode: FileMode.append);
  }

  static Future<void> log(String text, {bool logIf = true, String level = "DEBUG", Object? error, StackTrace? stackTrace}) async {
    if(!logIf) {
      return;
    }
    
    var date = DateTime.now();
    var msg = "[${date.hour}:${date.minute}] [$level] $text";
    if(error != null) {
      msg += " ERROR [${error.toString()}]";
    }

    if(stackTrace != null) {
      msg += " STACKTRACE [${stackTrace.toString()}]";
    }

    stdout.writeln(msg);

    _fileWriter.writeln([msg]);
    await _fileWriter.flush();
  }
}