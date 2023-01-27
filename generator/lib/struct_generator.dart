import 'package:nexema_generator/generator.dart';
import 'package:nexema_generator/mapper.dart';
import 'package:nexema_generator/models.dart';
import 'package:nexema_generator/type_generator.dart';

class StructGenerator extends TypeGenerator {
  final NexemaTypeDefinition type;
  String get reflectionClassName => "${type.name}Fields";

  StructGenerator(this.type);

  String generate() {
    return '''${type.documentation.isEmpty ? '' : type.documentation.map((e) => "/// $e").join("\n")}
class ${type.dartName} extends \$nex.NexemaType {
  static final $reflectionClassName fields = $reflectionClassName._();

  final \$nex.StructTypeState<${type.dartName}> _state;

  ${type.dartName}._empty() : _state = \$nex.StructTypeState([${List.filled(type.fields.length, "null").join(",")}]), super();
  ${type.dartName}._internal(\$core.Iterable<\$core.dynamic> values) : _state = \$nex.StructTypeState(values.toList(growable: false)), super();

  factory ${type.dartName}({
    ${type.fields.map((e) => _writeFactoryConstructorParameter(e)).join(",\n")}
  }) {
    return ${type.dartName}._internal([${type.fields.map((e) => e.dartName).join(",")}]);
  }

  factory ${type.dartName}.decode(\$td.Uint8List buffer) {
    var instance = ${type.dartName}._empty();
    instance.mergeFrom(buffer);
    return instance;
  }
  
  ${type.fields.map((e) => _writeGetterAndSetter(e)).join("\n")}

  @\$core.override
  \$td.Uint8List encode() {
    var writer = \$nex.getWriter();
    ${type.fields.map((e) => getEncoderFor(e.type!, e.dartName)).join("\n")}
    return writer.takeBytes();
  }
  
  @\$core.override
  void mergeFrom(\$td.Uint8List buffer) {
    var reader = \$nex.getReader(buffer);
    _state.setAll([
      ${type.fields.map((e) => _getDecoderFor(e.type!)).join(",\n")}
    ]);
  }

  @\$core.override
  \$core.int get hashCode => _state.hashCode;
  
  @\$core.override
  \$core.bool operator ==(\$core.Object other) {
    if(other is! ${type.dartName}) {
      return false;
    }

    return other._state == _state;
  }

  @\$core.override
  \$core.String toString() => "${type.dartName}(${type.fields.map((e) => '${e.dartName}: \$${e.dartName}').join(", ")})";
} 

class $reflectionClassName {
  $reflectionClassName._();

  static final \$nex.StateGetter<\$nex.StructTypeState<${type.dartName}>, ${type.dartName}> _stateGetter = _resolveState;

  static \$nex.StructTypeState<${type.dartName}> _resolveState(${type.dartName} instance) => instance._state;

  ${type.fields.map((e) => _writeReflectionFieldGetter(e)).join("\n\n")}
}
''';
  }

  String _writeReflectionFieldGetter(NexemaTypeFieldDefinition field) {
    return '''final ${field.dartName} = \$nex.FieldInfo<${type.dartName}>(_stateGetter, name: "${field.name}", dartName: "${field.dartName}", index: ${field.index}, valueType: const ${_writeFieldValueType(field.type!)});''';
  }

  String _writeFieldValueType(NexemaValueType valueType) {
    var typeArguments = <String>[];
    if(valueType is NexemaPrimitiveValueType) {
      typeArguments.addAll(valueType.typeArguments.map((e) => _writeFieldValueType(valueType)));
    }

    return '''
\$nex.FieldValueType(isNullable: ${valueType.nullable}, kind: \$nex.FieldValueKind.${getKind(valueType)}, typeArguments: ${typeArguments.isEmpty ? 'null' : typeArguments.join(", ")})
''';
  }

  String _writeFactoryConstructorParameter(NexemaTypeFieldDefinition field) {
    var declaration = getTypeDeclaration(field.type!);
    if(field.type!.nullable) {
      return '$declaration ${field.dartName}';
    }
    return 'required $declaration ${field.dartName}';
  } 

  String _writeGetterAndSetter(NexemaTypeFieldDefinition field) {
    var declaration = getTypeDeclaration(field.type!);
    return '''
$declaration get ${field.dartName} => _state.get(${field.index}) as $declaration;
set ${field.dartName}($declaration value) {
  _state.set(${field.index}, value);
}
''';
  }

  String _getDecoderFor(NexemaValueType valueType) {
    String decoder;
    if(valueType is NexemaPrimitiveValueType) {
      if(valueType.primitive == "list") {
        decoder = '''\$core.List.generate(reader.beginArrayDecode(), (index) => ${_getDecoderFor(valueType.typeArguments.first)});''';
      } else if(valueType.primitive == "map") {
        decoder = '''\$nex.generateMap(reader.beginMapDecode(), () => ${_getDecoderFor(valueType.typeArguments.first)}, () => ${_getDecoderFor(valueType.typeArguments.last)})''';
      } else {
        decoder = '''reader.${kDecoderMapper[valueType.primitive]}()''';
      }
    } else if(valueType is NexemaTypeValueType) {
      var reference = Generator.defaultGenerator.resolve(valueType.typeId);
      if(reference.type.isEnum) {
        decoder = "${reference.getDeclaration()}.byIndex(reader.decodeUint8()) ?? ${getEnumDefaultValueDeclaration(reference.type)}";
      } else {
        decoder = "${reference.getDeclaration()}.decode(reader.decodeBinary())";
      }

    } else {
      throw "Type ${valueType.runtimeType} unknown.";
    }

    if(valueType.nullable) {
      return "reader.isNextNull() ? null : ($decoder)";
    }

    return decoder;
  }
}