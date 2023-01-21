import 'dart:io';

import 'package:code_builder/code_builder.dart' hide TypeReference;
import 'package:dart_style/dart_style.dart';
import 'package:nexema_dart_generator/generator/enum_generator.dart';
import 'package:nexema_dart_generator/generator/struct_generator.dart';
import 'package:nexema_dart_generator/generator/union_generator.dart';
import 'package:nexema_dart_generator/models.dart';
import 'package:nexema_dart_generator/sanitizer.dart';
import 'package:nexema_dart_generator/type_reference.dart';

class Builder {
  final GenerateInput input;
  final Map<String, String> _files = {};
  final DartFormatter _formatter = DartFormatter(fixes: StyleFix.all, pageWidth: 100);

  Builder(this.input);

  void build() {
    TypeReferenceRegistry.fill(input.rootPackage, input.options["packageName"] as String, input.outputPath);
    Sanitizer.sanitize(input.rootPackage);

    _generateNode(input.rootPackage);

    for(var entry in _files.entries) {
      String fileName = entry.key;
      String code = entry.value;

      var f = File('${input.outputPath}/$fileName.dart');
      f.createSync(recursive: true);
      f.writeAsStringSync(code);
    }
  }

  void _generateNode(DeclarationNode node) {
    for(var child in node.children) {
      if(child.value is FileDeclaration) {
        String code = _generateFile(child.value as FileDeclaration);
        _files[child.value.path] = code;
      } else {
        _generateNode(child);
      }
    }
  }

  String _generateFile(FileDeclaration file) {
    final libBuilder = LibraryBuilder();

    for(var type in file.types) {
      switch(type.modifier) {
        case SchemaTypeModifier.struct:
          _generateStruct(type, libBuilder);
          break;

        case SchemaTypeModifier.$enum:
          _generateEnum(type, libBuilder);
          break;

        case SchemaTypeModifier.union:
          _generateUnion(type, libBuilder);
          break;
      }
    }

    var library = libBuilder.build();
    var emitter = DartEmitter.scoped(orderDirectives: true, useNullSafetySyntax: true);
    return _formatter.format(library.accept(emitter).toString());
  }

  void _generateStruct(SchemaTypeDefinition type, LibraryBuilder lib) {
    StructGenerator(lib, type).generate();
  }

  void _generateUnion(SchemaTypeDefinition type, LibraryBuilder lib) {
    UnionGenerator(lib, type).generate();
  }

  void _generateEnum(SchemaTypeDefinition type, LibraryBuilder lib) {
    EnumGenerator(lib, type).generate();
  }

  
  
}