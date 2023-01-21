import 'package:code_builder/code_builder.dart';
import 'package:nexema_dart_generator/constants.dart';
import 'package:nexema_dart_generator/generator/utils.dart';
import 'package:nexema_dart_generator/models.dart';
import 'package:nexema_dart_generator/primitive_mapper.dart';
import 'package:nexema_dart_generator/type_reference.dart';

const _deepCollectionEqualityReference = Reference("kDeepCollectionEquality", kMessagePackImport);
const _structHandlerReference = Reference("StructHandler", kMessagePackImport);
const _schemaStructDefinitionReference = Reference("SchemaStructDefinition", kMessagePackImport);
const _defaultValueGetterReference = Reference("DefaultValueGetter", kMessagePackImport);
const _uint8ListReference = Reference("Uint8List", "dart:typed_data");
const _fieldInfoReference = Reference("FieldInfo", kMessagePackImport);
const _fieldValueTypeReference = Reference("FieldValueType", kMessagePackImport);

class StructGenerator {
  final LibraryBuilder _lib;
  final SchemaTypeDefinition _schemaType;
  final Reference _schemaTypeReference;

  StructGenerator(this._lib, this._schemaType) : _schemaTypeReference = Reference(_schemaType.name);

  void generate() {
    _lib.body.add(Class(_internalGenerate));
  }

  void _internalGenerate(ClassBuilder c) {
      c.name = _schemaType.name;
      c.extend = refer("SchemaStruct<${_schemaType.name}>", kMessagePackImport);

      // Write fieldset
      c.fields.add(Field((b) {
        b.static = true;
        b.modifier = FieldModifier.constant;
        b.name = "_fieldset";

        var scopedCode = Code.scope((callback) {
          var fieldInfoRef = callback(_fieldInfoReference);
          var fieldValueTypeRef = callback(_fieldValueTypeReference);

          var code = StringBuffer("<$fieldInfoRef>[");

          for(var field in _schemaType.fields) {
            code.write("$fieldInfoRef(name: '${field.name}', index: ${field.index}, nullable: ${field.type!.nullable}, valueType: $fieldValueTypeRef.${field.type!.primitive.name}");

            if(field.type!.typeArguments.isNotEmpty) {
              code.write(",typeArguments: [${field.type!.typeArguments.map((e) => '$fieldValueTypeRef.${e.primitive.name}').join(',')}]");
            } else {
              code.write(",typeArguments: []");
            }

            code.writeln("),");
          }

          code.writeln("]");

          return code.toString();
        }); 

        b.assignment = scopedCode;

        // b.assignment = Code(code);
      }));
    
      // Write _defaults
      c.fields.add(Field((b) {
        b.name = "_defaults";
        b.static = true;
        b.modifier = FieldModifier.final$;
        
        b.assignment = Code.scope((resolver) {
          var code = StringBuffer("<${resolver(_defaultValueGetterReference)}>[");

          for(var field in _schemaType.fields) {
            switch(field.type!.primitive) {
              case FieldPrimitive.custom:
                // Lookup type in TypeRegistry
                var typeReference = TypeReferenceRegistry.getReference(field.type!.importId);
                var type = typeReference.type;
                if(type.modifier == SchemaTypeModifier.$enum) {
                  code.writeln("(args) => ${type.name}.values[args!.first],");
                } else if(type.modifier == SchemaTypeModifier.struct) {
                  code.writeln("(args) => ${structDefault(resolver(typeReference.reference))},");
                } else if(type.modifier == SchemaTypeModifier.union) {
                  code.writeln("(args) => ${unionDefault(resolver(typeReference.reference))},");
                }
                break;

              case FieldPrimitive.string:
                code.writeln("(args) => '',");
                break;

              case FieldPrimitive.boolean:
                code.writeln("(args) => false,");
                break;

              case FieldPrimitive.uint8:
              case FieldPrimitive.uint16:
              case FieldPrimitive.uint32:
              case FieldPrimitive.int8:
              case FieldPrimitive.int16:
              case FieldPrimitive.int32:
              case FieldPrimitive.int64:
                code.writeln("(args) => 0,");
                break;

              case FieldPrimitive.uint64:
                code.writeln("(args) => 0,");
                break;

              case FieldPrimitive.float32:
              case FieldPrimitive.float64:
                code.writeln("(args) => 0.0,");
                break;

              case FieldPrimitive.list:
                String typeArgument = PrimitiveMapper.mapper[field.type!.typeArguments.first.primitive]!;
                code.writeln("(args) => <$typeArgument>[],");
                break;

              case FieldPrimitive.map:
                String keyArgument = PrimitiveMapper.mapper[field.type!.typeArguments.first.primitive]!;
                String valueArgument = PrimitiveMapper.mapper[field.type!.typeArguments.last.primitive]!;
                code.writeln("(args) => <$keyArgument, $valueArgument>{},");
                break;

              case FieldPrimitive.binary:
                code.writeln("(args) => ${resolver(_uint8ListReference)}.fromList(const []),");
                break;
            }
          }

          code.write("]");
          return code.toString();
        });
      }));
    
      // Write _schema
      c.fields.add(Field((b) {
        b.name = "_schema";
        b.modifier = FieldModifier.final$;
        b.assignment = Code.scope((resolve) {
          return "${resolve(_schemaStructDefinitionReference)}<${_schemaType.name}>(_fieldset, ${_schemaType.fields.length}, _defaults)";
        });
      }));

      // Write _handler
      c.fields.add(Field((b) {
        b.name = "_handler";
        b.late = true;
        b.type = createTypeReference(_structHandlerReference, [_schemaTypeReference]);
        b.modifier = FieldModifier.final$;
      }));

      // Write private constructor
      c.constructors.add(Constructor((ctor) {
        ctor.name = "_";
        ctor.body = Code.scope((resolver) {
          var structHandlerRef = resolver(_structHandlerReference);
          return "_handler = $structHandlerRef<${_schemaType.name}>(_schema);";
        });
      }));
    
      // Write factory constructor
      c.constructors.add(Constructor((ctor) {
        ctor.factory = true;
        ctor.optionalParameters.addAll(_schemaType.fields.map((field) => Parameter((param) {
          param.named = true;
          param.name = field.name;

          bool hasDefaultTo = true;
          if(field.type!.primitive == FieldPrimitive.custom) {
            var structTypeReference = TypeReferenceRegistry.getReference(field.type!.importId);

            if(structTypeReference.type.modifier != SchemaTypeModifier.$enum) {
              param.type = structTypeReference.reference.asNullable;
              hasDefaultTo = false;
            } else {
              param.type = structTypeReference.reference;
              hasDefaultTo = true;
            }
          } else {
            if(field.type!.primitive == FieldPrimitive.list) {
              param.type = buildListReference(field.type!.typeArguments[0]);
            } else if(field.type!.primitive == FieldPrimitive.map) {
              param.type = buildMapReference(field.type!.typeArguments[0], field.type!.typeArguments[1]);
            } else {
              var value = PrimitiveMapper.typeReferences[field.type!.primitive]!;
              if(field.type!.primitive == FieldPrimitive.uint64) {
                hasDefaultTo = false;
              } else if(field.type!.primitive == FieldPrimitive.binary) {
                hasDefaultTo = false;
              }

              param.type = value;
            }
          }

          if(field.type != null && (field.type!.nullable || field.type?.primitive == FieldPrimitive.uint64 || field.type?.primitive == FieldPrimitive.binary)) {
            param.type = param.type!.asNullable;
          }
          
          var defaultValue = PrimitiveMapper.getDartDefaultFor(field.type!.primitive, field.type!.typeArguments, field.type!.importId, true);
          if(!defaultValue.second && hasDefaultTo && !field.type!.nullable) {
            param.defaultTo = defaultValue.first;
          }
        })));
      
        ctor.body = Code.scope((resolver) {
          var bodyWriter = StringBuffer();
          bodyWriter.writeln("var instance = ${_schemaType.name}._();");
          bodyWriter.writeln("instance._schema.setFields([");

          for(var field in _schemaType.fields) {
            if(field.type != null && field.type!.primitive == FieldPrimitive.custom) {
              var typeReference = TypeReferenceRegistry.getReference(field.type!.importId);
              var type = typeReference.type;
              if(type.modifier == SchemaTypeModifier.union) {
                bodyWriter.write("${field.name} ?? ${resolver(typeReference.reference)}.empty(),");
              } else if(type.modifier == SchemaTypeModifier.struct) {
                bodyWriter.write("${field.name} ?? ${resolver(typeReference.reference)}()");
              }
            } else {
              bodyWriter.write(field.name);

              if(!field.type!.nullable) {
                if(field.type!.primitive == FieldPrimitive.uint64) {
                  bodyWriter.write(" ?? BigInt.zero");
                } else if(field.type!.primitive == FieldPrimitive.binary) {
                  bodyWriter.write(" ?? ${resolver(_uint8ListReference)}.fromList(const [])");
                }
              }

              bodyWriter.write(",");
            }
          }

          bodyWriter.writeln("]);");
          bodyWriter.writeln("return instance;");

          return bodyWriter.toString();
        });
      }));

      // Write getters and setters
      for(var field in _schemaType.fields) {
        Reference type;
        if(field.type!.primitive == FieldPrimitive.custom) {
          var reference = TypeReferenceRegistry.getReference(field.type!.importId);
          
          type = refer(reference.type.name, reference.importPath);
        } else {
          if(field.type!.primitive == FieldPrimitive.list) {
            type = buildListReference(field.type!.typeArguments[0]);
          } else if(field.type!.primitive == FieldPrimitive.map) {
            type = buildMapReference(field.type!.typeArguments[0], field.type!.typeArguments[1]);
          } else {
            var reference = PrimitiveMapper.typeReferences[field.type!.primitive];
            if(reference != null) {
              type = reference;
            } else {
              type = refer(PrimitiveMapper.mapper[field.type!.primitive]!);
            }
          }
        }

        if(field.type!.nullable) {
          type = type.asNullable;
        }

        c.methods.addAll([
          Method((b) {
            b.name = field.name;
            b.type = MethodType.getter;
            b.lambda = true;
            b.returns = type;
            b.body = Code.scope((resolver) {
              return '_handler.getValue(${field.index})';
            });
          }),
          Method((b) {
            b.name = field.name;
            b.type = MethodType.setter;
            b.lambda = true;
            b.requiredParameters.add(Parameter((p) {
              p.type = type;
              p.name = "value";
            }));

            if(field.type!.primitive == FieldPrimitive.list) {
              b.body = Code.scope((resolver) => '_handler.setList(${field.index}, value)');
            } else if(field.type!.primitive == FieldPrimitive.map) {
              b.body = Code.scope((resolver) => '_handler.setMap(${field.index}, value)');
            } else {
              b.body = Code.scope((resolver) => '_handler.setValue(${field.index}, value)');
            }
          })
        ]);
      }

      // Write hashCode
      c.methods.add(Method((m) {
        m.lambda = true;
        m.type = MethodType.getter;
        m.name = "hashCode";
        m.returns = refer("int");
        m.annotations.add(refer("override"));
        m.body = Code("_handler.getHash(() => Object.hashAll([${_schemaType.fields.map((e) => e.name).join(",")}]))");
      }));

      // Write == method
      c.methods.add(Method((m) {
        m.name = "operator ==";
        m.returns = refer("bool");
        m.requiredParameters.add(Parameter((p) {
          p.type = refer("Object");
          p.name = "other";
        }));

        m.annotations.add(refer("override"));

        m.body = Code.scope((resolver) => """
if(other is! ${_schemaType.name}) {
  return false;
}

return ${_schemaType.fields.map((e) {
  if(e.type!.primitive == FieldPrimitive.list || e.type!.primitive == FieldPrimitive.map) {
    return '${resolver(_deepCollectionEqualityReference)}.equals(${e.name}, other.${e.name})';
  } else {
    return '${e.name} == other.${e.name}';
  }
}).join("&&")};
""");
      }));
    
      // Write toString method
      c.methods.add(Method((m) {
        m.name = "toString";
        m.returns = refer("String");
        m.lambda = true;
        m.annotations.add(refer("override"));
        m.body = Code("'${_schemaType.fields.map((e) => '${e.name}(\$${e.name})').join(" ")}'");
      }));

      // Write clone method
      c.methods.add(Method((m) {
        m.annotations.add(refer("override"));
        m.returns = refer(_schemaType.name);
        m.name = "clone";
        m.body = Code('''
var newInstance = ${_schemaType.name}._();
newInstance.mergeUsing(this);

return newInstance;
''');
      }));

      // Write serialization methods
      c.methods.addAll([
        Method((m) {
          m.name = "serialize";
          m.lambda = true;
          m.returns = refer("Uint8List", "dart:typed_data");
          m.annotations.add(refer("override"));
          m.body = const Code('_handler.getBuffer()');
        })
      ]);

      // Write deserialization methods
      c.methods.addAll([
        Method((m) {
          m.name = "mergeFrom";
          m.lambda = true;
          m.returns = refer("void");
          m.annotations.add(refer("override"));
          m.requiredParameters.add(Parameter((p) {
            p.name = "buffer";
            p.type = refer("Uint8List", "dart:typed_data");
          }));

          m.body = const Code('_handler.merge(buffer)');
        }),

        Method((m) {
          m.name = "mergeUsing";
          m.returns = refer("void");
          m.lambda = true;
          m.annotations.add(refer("override"));
          m.requiredParameters.add(Parameter((p) {
            p.name = "other";
            p.type = refer(_schemaType.name);
          }));
          m.body = const Code('_handler.mergeUsing(other._handler)');
        }),

        Method((m) {
          m.name = "fromBuffer";
          m.static = true;
          m.returns = refer(_schemaType.name);
          m.requiredParameters.add(Parameter((p) {
            p.name = "buffer";
            p.type = refer("Uint8List", "dart:typed_data");
          }));

          m.body = Code('''
var instance = ${_schemaType.name}._();
instance.mergeFrom(buffer);

return instance;
''');
        })
      ]);
  }
}