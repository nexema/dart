import 'package:code_builder/code_builder.dart';
import 'package:messagepack_schema_dart_generator/constants.dart';
import 'package:messagepack_schema_dart_generator/models.dart';

const _enumNotFoundReference = Reference('EnumNotFound', kMessagePackImport);

class EnumGenerator {
  final LibraryBuilder _lib;
  final SchemaTypeDefinition _schemaType;
  final Reference _schemaTypeReference;

  EnumGenerator(this._lib, this._schemaType) : _schemaTypeReference = Reference(_schemaType.name);

  void generate() {
    _lib.body.add(Class(_internalGenerate));
  }

  void _internalGenerate(ClassBuilder c) {
    c.name = _schemaType.name;
    c.extend = refer("SchemaEnum<${_schemaType.name}>", kMessagePackImport);

    // Add constructor
    c.constructors.add(Constructor((ctor) {
      ctor.name = "_";
      ctor.constant = true;
      ctor.requiredParameters.addAll([
        Parameter((param) {
          param.name = "index";
          param.type = refer("int");
        }),
        Parameter((param) {
          param.name = "name";
          param.type = refer("String");
        })
      ]);

      ctor.initializers.add(Code('super(index, name)'));
    }));
  
    // Add static methods
    c.methods.addAll([
      Method((method) {
        method.name = "valueOf";
        method.static = true;
        method.returns = _schemaTypeReference;
        method.requiredParameters.add(Parameter((param) {
          param.type = refer("int");
          param.name = "index";
        }));
        method.body = Code.scope((resolver) => 'try{return values[index];}catch(_){throw ${resolver(_enumNotFoundReference)}.byIndex(index);}');
      }),
      Method((method) {
        method.name = "fromName";
        method.static = true;
        method.returns = _schemaTypeReference;
        method.requiredParameters.add(Parameter((param) {
          param.type = refer("String");
          param.name = "name";
        }));
        method.body = Code.scope((resolver) => 'try{return _byName[name]!;}catch(_){throw ${resolver(_enumNotFoundReference)}.byName(name);}');
      })
    ]);
  
    // Add type fields
    for(var field in _schemaType.fields) {
      c.fields.add(Field((fb) {
        fb.name = field.name;
        fb.static = true;
        fb.modifier = FieldModifier.constant;
        fb.type = _schemaTypeReference;
        fb.assignment = Code('${_schemaType.name}._(${field.index}, "${field.name}")');
      }));
    }

    // Add "values" fields
    c.fields.add(Field((b) {
      b.modifier = FieldModifier.constant;
      b.static = true;
      b.name = "values";
      b.type = refer("List<${_schemaType.name}>");
      b.assignment = Code('[${_schemaType.fields.map((e) => e.name).join(",")}]');
    }));
  
    // Add _byName field
    c.fields.add(Field((b) {
      b.static = true;
      b.modifier = FieldModifier.constant;
      b.type = refer("Map<String, ${_schemaType.name}>");
      b.name = "_byName";
      b.assignment = Code('''{
        ${_schemaType.fields.map((e) => '"${e.name}": ${e.name}').join(",")}
      }''');
    }));
  }
}