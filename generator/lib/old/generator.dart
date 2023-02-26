// ignore_for_file: prefer_void_to_null

import 'dart:collection';
import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:nexema_generator/enum_generator.dart';
import 'package:nexema_generator/models.dart';
import 'package:nexema_generator/struct_generator.dart';
import 'package:nexema_generator/union_generator.dart';
import 'package:path/path.dart' as p;

const _kDefaultImports = [
  r"'package:nexema/nexema.dart' as $nex",
  r"'dart:typed_data' as $td",
  r"'dart:core' as $core"
];

class Generator {
  static late final Generator defaultGenerator;

  final GeneratorSettings settings;
  final NexemaSnapshot definition;
  final DartFormatter _formatter = DartFormatter(fixes: StyleFix.all);
  final Map<int, TypeReference> _types = {};
  final Map<String, Null> _currentFileImports = {}; 
  final Map<File, String> _generatedSourceCode = {};
  
  Map<File, String> get generatedSourceCode => UnmodifiableMapView(_generatedSourceCode);
  String get currentFilePath => p.join(settings.outputPath, _currentFile!.fileName);

  NexemaFile? _currentFile;

  Generator({required this.definition, required this.settings}) {
    _resetImports();
    _scan();
    defaultGenerator = this;
  }

  void generate() {
    for(var file in definition.files) {
      _currentFile = file;
      var fileWriter = StringBuffer();

      // generate each type
      for(var type in file.types) {
        String sourceCode = generateDefinition(type);
        fileWriter.writeln(sourceCode);
      }

      // format source code
      String fileSourceCode = "${_getFormattedImports()}\n${fileWriter.toString()}";
      try {
        fileSourceCode = _formatter.format(fileSourceCode, uri: file.fileName);
        _generatedSourceCode[File(p.join(settings.outputPath, "${file.fileName}.dart"))] = fileSourceCode;
      } catch(err) {
        print(fileSourceCode);
        rethrow;
      }

      _resetImports();
    }
  }

  String generateDefinition(NexemaTypeDefinition definition) {
    switch(definition.modifier) {
      case "struct": return StructGenerator(definition).generate();
      case "enum": return EnumGenerator(definition).generate();
      case "union": return UnionGenerator(definition).generate();
      default: throw "Unknown modifier ${definition.modifier}";
    }
  }

  TypeReference resolve(int typeId) {
    try {
      var typeReference =  _types[typeId]!;
      if(currentFilePath != typeReference.path) {
        _currentFileImports["'${_resolveImport(typeReference.path)}.dart' as ${typeReference.importAlias}"] = null;
      }
      return typeReference; 
    } catch(err) {
      throw Exception("Could not resolve TypeReference for type id '$typeId'. Error: $err");
    }
  }

  /// gets the absolute path to [path] from [currentFilePath]
  String _resolveImport(String path) {
    String relative = p.relative(path, from: p.dirname(currentFilePath));
    return relative;
  }

  void _scan() {
    for(var file in definition.files) {
      for(var type in file.types) {
        _types[type.id] = TypeReference(
          type: type, 
          path: p.join(settings.outputPath, file.fileName),
          importAlias: "\$${p.basenameWithoutExtension(file.fileName)}"
        ); 
      }
    }
  }

  void _resetImports() {
    _currentFileImports.clear();
    _currentFileImports.addEntries(_kDefaultImports.map((e) => MapEntry(e, null)));
  }

  String _getFormattedImports() {
    return _currentFileImports.keys.map((e) => "import $e;").join("\n");
  }
}