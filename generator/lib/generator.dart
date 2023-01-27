// ignore_for_file: prefer_void_to_null

import 'dart:collection';
import 'dart:io';

import 'package:dart_style/dart_style.dart';
import 'package:nexema_generator/enum_generator.dart';
import 'package:nexema_generator/models.dart';
import 'package:nexema_generator/struct_generator.dart';
import 'package:nexema_generator/union_generator.dart';
import 'package:path/path.dart' as path;

const _kDefaultImports = [
  r"'package:nexema/nexema.dart' as $nex",
  r"'dart:typed_data' as $td",
  r"'dart:core' as $core"
];

class Generator {
  static late final Generator defaultGenerator;

  final String outputPath;
  final NexemaDefinition definition;
  final DartFormatter _formatter = DartFormatter(fixes: StyleFix.all);
  final Map<String, TypeReference> _types = {};
  final Map<File, String> _generatedSourceCode = {};
  final Map<String, Null> _currentFileImports = {}; 
  
  Map<File, String> get generatedSourceCode => UnmodifiableMapView(_generatedSourceCode);

  NexemaFile? _currentFile;

  Generator({required this.definition, required this.outputPath}) {
    _resetImports();
    defaultGenerator = this;
    _scan();
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
      fileSourceCode = _formatter.format(fileSourceCode, uri: file.name);
      _generatedSourceCode[File(path.join(outputPath, "${file.name}.dart"))] = fileSourceCode;

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

  void _scan() {
    for(var file in definition.files) {
      for(var type in file.types) {
        _types[type.id] = TypeReference(
          type: type, 
          path: file.name,
          importAlias: "\$${path.basenameWithoutExtension(file.name)}"
        ); 
      }
    }
  }

  TypeReference resolve(String typeId) {
    try {
      var typeReference =  _types[typeId]!;
      if(_currentFile!.name != typeReference.path) {
        _currentFileImports["'${typeReference.path}.dart' as ${typeReference.importAlias}"] = null;
      } else {
        typeReference = typeReference.copyWith();
      }
      return typeReference; 
    } catch(err) {
      throw Exception("Could not resolve TypeReference for type id '$typeId'. Error: $err");
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

class TypeReference {
  final NexemaTypeDefinition type;
  final String path;
  final String? importAlias;

  TypeReference({required this.type, required this.path, required this.importAlias});

  TypeReference copyWith({String? importAlias}) => TypeReference(
    type: type,
    path: path,
    importAlias: importAlias
  );

  String getDeclaration() {
    if(importAlias == null) {
      return type.dartName;
    }

    return "$importAlias.${type.dartName}";
  }
}