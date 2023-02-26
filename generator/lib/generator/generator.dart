import 'package:dart_style/dart_style.dart';
import 'package:nexema_generator/generator/defaults.dart';
import 'package:nexema_generator/generator/type_reference.dart';
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

  /// gets the absolute path to [path] from [currentFilePath]
  String _resolveImportFor(NexemaFile file, String p) {
    String relative = path.relative(p, from: path.dirname(file.path));
    return relative;
  }

  void _scan() {
    for(var file in snapshot.files) {
      for(var type in file.types) {
        _types[type.id] = TypeReference(
          type: type, 
          path: path.join(settings.outputPath, file.fileName),
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