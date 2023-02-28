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
  final Map<int, TypeReference> _types = {};
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
    Map<int, GeneratedFile> files = {};

    try {
      for(var file in snapshot.files) {
        final sb = StringBuffer();
        for(var type in file.types) {
          switch(type.modifier) {
            case kBaseModifier:
              sb.writeln(BaseGenerator.generateFor(file, type));
              break;

            case kStructModifier:
              sb.writeln(StructGenerator.generateFor(file, type));
              break;

            case kEnumModifier:
              sb.writeln(EnumGenerator.generateFor(file, type));
              break;

            case kUnionModifier:
              sb.writeln(UnionGenerator.generateFor(file, type));
              break;
          }
        }

        String sourceCode = sb.toString();
        sourceCode = "${_currentFileImports.keys.map((e) => "import $e;").join("\n")}\n$sourceCode";
        _resetImports();

        files[file.id] = GeneratedFile(
          id: file.id, 
          name: "${file.fileName}.dart", 
          contents: _formatter.format(sourceCode)
        );
      }
    } catch(err) {
      return PluginResult(exitCode: -1, files: []);
    }

    return PluginResult(exitCode: 0, files: files.values.toList());
  }

  TypeReference resolveFor(NexemaFile file, int objectId) {
    try {
      var typeReference =  _types[objectId]!;
      if(file.fileName != typeReference.path) {
        _currentFileImports["'${_resolveImportFor(file, typeReference.path)}.dart' as ${typeReference.importAlias}"] = null;
      }
      return typeReference; 
    } catch(err) {
      throw Exception("Could not resolve TypeReference for type id '$objectId'. Error: $err");
    }
  }

  /// gets the absolute path to [p] from [file.path]
  String _resolveImportFor(NexemaFile file, String p) {
    String relative = path.relative(p, from: path.dirname(path.join(settings.outputPath, file.path, file.fileName)));
    return relative;
  }

  void _scan() {
    for(var file in snapshot.files) {
      for(var type in file.types) {
        _types[type.id] = TypeReference(
          type: type, 
          path: path.join(settings.outputPath, file.path, file.fileName),
          importAlias: "\$${path.basenameWithoutExtension(file.fileName).snakeCase}"
        ); 
      }
    }
  }

  void _resetImports() {
    _currentFileImports.clear();
    _currentFileImports.addEntries(kDefaultImports.map((e) => MapEntry(e, null)));
  }
}