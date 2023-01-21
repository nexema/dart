import 'package:code_builder/code_builder.dart';
import 'package:nexema_dart_generator/models.dart';
import 'package:nexema_dart_generator/references.dart';
import 'package:nexema_dart_generator/tuple.dart';
import 'package:nexema_dart_generator/type_reference.dart';

/// Maps Primitive to Dart types.
class PrimitiveMapper {
  PrimitiveMapper._();

  static const mapper = <FieldPrimitive, String>{
    FieldPrimitive.string: "String",
    FieldPrimitive.boolean: "bool",
    FieldPrimitive.uint8: "int",
    FieldPrimitive.uint16: "int",
    FieldPrimitive.uint32: "int",
    FieldPrimitive.uint64: "BigInt",
    FieldPrimitive.int8: "int",
    FieldPrimitive.int16: "int",
    FieldPrimitive.int32: "int",
    FieldPrimitive.int64: "int",
    FieldPrimitive.float32: "double",
    FieldPrimitive.float64: "double",
    FieldPrimitive.binary: "Uint8List",
  };

  /// Contains a mapper between Primitive and Reference
  static const typeReferences = <FieldPrimitive, Reference> {
    FieldPrimitive.string: Reference("String"),
    FieldPrimitive.boolean: Reference("bool"),
    FieldPrimitive.uint8: Reference("int"),
    FieldPrimitive.uint16: Reference("int"),
    FieldPrimitive.uint32: Reference("int"),
    FieldPrimitive.uint64: Reference("BigInt"),
    FieldPrimitive.int8: Reference("int"),
    FieldPrimitive.int16: Reference("int"),
    FieldPrimitive.int32: Reference("int"),
    FieldPrimitive.int64: Reference("int"),
    FieldPrimitive.float32: Reference("double"),
    FieldPrimitive.float64: Reference("double"),
    FieldPrimitive.binary: kUint8ListReference
  };

  /// The default value of each primitive, as Dart code
  static final defaults = <FieldPrimitive, Code> {
    FieldPrimitive.string: Code("''"),
    FieldPrimitive.boolean: Code("false"),
    FieldPrimitive.uint8: Code("0"),
    FieldPrimitive.uint16: Code("0"),
    FieldPrimitive.uint32: Code("0"),
    FieldPrimitive.uint64: Code("0"),
    FieldPrimitive.int8: Code("0"),
    FieldPrimitive.int16: Code("0"),
    FieldPrimitive.int32: Code("0"),
    FieldPrimitive.int64: Code("0"),
    FieldPrimitive.float32: Code("0.0"),
    FieldPrimitive.float64: Code("0.0"),
    FieldPrimitive.binary: Code.scope((resolver) => "${resolver(kUint8ListReference)}.fromList(const [])"),
  };

  /// Returns the default value as Dart code for a primitive type.
  /// It returns the Dart code and a boolean that indicates if the type is a union
  static Tuple<Code, bool> getDartDefaultFor(FieldPrimitive primitive, List<SchemaFieldType> typeArguments, String typeId, [bool anonymous = false]) {
    if(primitive == FieldPrimitive.list) {
      return tuple(anonymous ? Code("const []") : Code("const List<${mapper[typeArguments.first.primitive]}>()"), false);
    }

    if(primitive == FieldPrimitive.map) {
      return tuple(anonymous ? Code("const {}") : Code("const Map<${mapper[typeArguments.first.primitive]}, ${mapper[typeArguments.last.primitive]}>()"), false);
    }

    if(primitive == FieldPrimitive.custom) {
      var typeReference = TypeReferenceRegistry.getReference(typeId);
      var type = typeReference.type;

      switch(type.modifier) {
        case SchemaTypeModifier.$enum:
          return tuple(Code("${type.name}.${type.fields.first.name}"), false);

        case SchemaTypeModifier.struct:
          return tuple(Code("${type.name}()"), false);

        case SchemaTypeModifier.union:
          return tuple(Code("${type.name}.empty()"), true);
      }
    }
    
    var defaultValue = defaults[primitive];
    if(defaultValue == null) {
      throw Exception("Default value for $primitive not found.");
    }

    return tuple(defaultValue, false);
  }
}