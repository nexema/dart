import 'package:dart_style/dart_style.dart';
import 'package:nexema_generator/generator/base/base_generator.dart';
import 'package:nexema_generator/generator/defaults.dart';
import 'package:nexema_generator/generator/enum/enum_generator.dart';
import 'package:nexema_generator/generator/struct/struct_generator.dart';
import 'package:nexema_generator/generator/type_reference.dart';
import 'package:nexema_generator/generator/union/union_generator.dart';
import 'package:nexema_generator/models.dart';
import 'package:path/path.dart' as path;
import 'package:recase/recase.dart';

/// Generator is the main entry point
class Generator {
  static Generator? _singleton;

  static Generator get defaultGenerator => _singleton!;

  final NexemaSnapshot snapshot;
  final GeneratorSettings settings;
  final Map<String, TypeReference> _types = {};
  final Map<String, void> _currentFileImports = {};
  final DartFormatter _formatter = DartFormatter(fixes: StyleFix.all);

  Generator._internal(this.snapshot, this.settings) {
    _resetImports();
    _scan();
  }

  factory Generator({required NexemaSnapshot snapshot, required GeneratorSettings settings}) {
    _singleton ??= Generator._internal(snapshot, settings);
    return _singleton!;
  }

  PluginResult run() {
    Map<String, GeneratedFile> files = {};

    try {
      for (var file in snapshot.files) {
        final sb = StringBuffer();
        for (var type in file.types) {
          switch (type.modifier) {
            case NexemaTypeModifier.base:
              sb.writeln(BaseGenerator.generateFor(file, type));
              break;

            case NexemaTypeModifier.struct:
              sb.writeln(StructGenerator.generateFor(file, type));
              break;

            case NexemaTypeModifier.enumerator:
              sb.writeln(EnumGenerator.generateFor(file, type));
              break;

            case NexemaTypeModifier.union:
              sb.writeln(UnionGenerator.generateFor(file, type));
              break;
          }
        }

        String sourceCode = sb.toString();
        sourceCode = "${_currentFileImports.keys.map((e) => "import $e;").join("\n")}\n$sourceCode";
        _resetImports();

        final filepath = "${file.path}.dart";
        files[file.id] = GeneratedFile(
            id: file.id,
            name: path.basename(filepath),
            filePath: filepath,
            contents: _formatter.format(sourceCode));
      }
    } catch (err) {
      return PluginResult(error: err.toString(), exitCode: -1, files: []);
    }

    return PluginResult(exitCode: 0, files: files.values.toList());
  }

  TypeReference resolveFor(NexemaFile file, String objectId) {
    try {
      var typeReference = _types[objectId]!;
      if (file.path != typeReference.path) {
        _currentFileImports[
                "'${_resolveImportFor(file, typeReference.path)}.dart' as ${typeReference.importAlias}"] =
            null;
      }
      return typeReference;
    } catch (err) {
      throw Exception("Could not resolve TypeReference for type id '$objectId'. Error: $err");
    }
  }

  /// gets the absolute path to [p] from [file.path]
  String _resolveImportFor(NexemaFile file, String p) {
    String relative =
        path.relative(p, from: path.dirname(path.join(settings.outputPath, file.path)));
    return relative;
  }

  void _scan() {
    for (var file in snapshot.files) {
      for (var type in file.types) {
        _types[type.id] = TypeReference(
            type: type,
            path: path.join(settings.outputPath, file.path),
            importAlias: "\$${path.basenameWithoutExtension(file.path).snakeCase}");
      }
    }
  }

  void _resetImports() {
    _currentFileImports.clear();
    _currentFileImports.addEntries(kDefaultImports.map((e) => MapEntry(e, null)));
  }
}
