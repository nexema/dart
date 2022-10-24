import 'package:code_builder/code_builder.dart';
import 'package:messagepack_schema_dart_generator/models.dart';
import 'package:path/path.dart' as p;

class TypeReferenceRegistry {
  static final Map<String, SchemaTypeReference> _types = {};
  
  static SchemaTypeReference getReference(String typeId) {
    try {
      return _types[typeId]!;
    } catch(_) {
      throw Exception("Type with id $typeId not found.");
    } 
  }

  static void fill(DeclarationNode root, String packageName, String outputPath) {
    outputPath = p.relative(outputPath).replaceAll(r"\", "/");

    for(var decl in root.children) {
      _lookupTypes(decl, packageName, outputPath);
    }
  }

  static void _lookupTypes(DeclarationNode declaration, String packageName, String outputPath) {
    if(declaration.children.isNotEmpty) {
      for (var decl in declaration.children) {
        _lookupTypes(decl, packageName, outputPath);
      }
    }

    if(declaration.value is FileDeclaration) {
      for(var t in (declaration.value as FileDeclaration).types) {
        String path = "package:$packageName/${p.basename(outputPath)}/${declaration.value.path.replaceAll("\\", "/")}.dart";
        TypeReferenceRegistry._types[t.id] = SchemaTypeReference(
          type: t,
          importPath: path
        );
      }
    }
  }
}

/// Contains the reference to schema type, with its import path
class SchemaTypeReference {
  final Reference _reference;

  final SchemaTypeDefinition type;
  final String importPath;

  Reference get reference => _reference;

  SchemaTypeReference({required this.type, required this.importPath}) : _reference = Reference(type.name, importPath);
}
