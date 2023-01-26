import 'package:nexema_generator/mapper.dart';
import 'package:nexema_generator/models.dart';
import 'package:nexema_generator/type_generator.dart';

class UnionGenerator extends TypeGenerator {
  final NexemaTypeDefinition type;
  String get fieldsEnumName => "${type.name}Field";

  UnionGenerator(this.type);

  String generate() {
    return '''${type.documentation.isEmpty ? '' : type.documentation.map((e) => "/// $e").join("\n")}
class ${type.dartName} extends NexemaType {

  final UnionTypeState<${type.dartName}, $fieldsEnumName> _state;

  ${type.dartName}._empty() : _state = UnionTypeState(null, $fieldsEnumName.notSet);
  ${type.dartName}._(dynamic value, $fieldsEnumName field) : _state = UnionTypeState(value, field);

  $fieldsEnumName get whichField => _state.currentField;
  bool get hasValue => _state.currentField != $fieldsEnumName.notSet;

  ${type.fields.map((e) => _writeFactoryConstructor(e)).join('\n')}

  factory ${type.dartName}.decode(Uint8List buffer) {
    var empty = ${type.dartName}._empty();
    empty.mergeFrom(buffer);
    return empty;
  }

  factory ${type.dartName}({
    ${type.fields.map((e) => '${getTypeDeclaration(e.type!)}? ${e.dartName}').join(", ")}
  }) {
    ${type.fields.map((e) => _writeGeneralFactoryBodySet(e)).join("\n")}

    return ${type.dartName}._(null, $fieldsEnumName.notSet);
  }

  ${type.fields.map((e) => _writeGetterSetter(e)).join("\n")}

  void clear() {
    _state.setCurrentValue(null, $fieldsEnumName.notSet);
  }

  @override
  Uint8List encode() {
    var writer = getWriter();
    switch(_state.currentField) {
      case $fieldsEnumName.notSet:
        writer.encodeNull();
        break;

      ${type.fields.map((e) => _writeEncodeField(e)).join("\n")}
    }

    return writer.takeBytes();
  }

  @override
  void mergeFrom(Uint8List buffer) {
    var reader = getReader(buffer);
    if(reader.isNextNull()) {
      clear();
    } else {
      int field = reader.decodeVarint();
      switch(field) {
        ${type.fields.map((e) => _writeDecodeField(e)).join("\n")}
      }
    }
  }

  @override
  int get hashCode => _state.hashCode;
  
  @override
  bool operator ==(Object other) {
    if(other is! AccountDetails) {
      return false;
    }

    return other._state == _state;
  }
}

enum $fieldsEnumName {
  notSet,
  ${type.fields.map((e) => e.dartName).join(',\n')}
}
''';
  }

  String _writeFactoryConstructor(NexemaTypeFieldDefinition field) {
    return '''
factory ${type.dartName}.${field.dartName}({required ${getTypeDeclaration(field.type!)} value}) {
  return ${type.dartName}._(value, $fieldsEnumName.${field.dartName});
}
''';
  }

  String _writeGeneralFactoryBodySet(NexemaTypeFieldDefinition field) {
    return '''
if(${field.dartName} != null) {
  return ${type.dartName}.${field.dartName}(value: ${field.dartName});
} 
''';
  }

  String _writeGetterSetter(NexemaTypeFieldDefinition field) {
    String fieldDeclaration = getTypeDeclaration(field.type!);
    return '''
$fieldDeclaration get ${field.dartName} => _state.get<$fieldDeclaration>($fieldsEnumName.${field.dartName});
set ${field.dartName}($fieldDeclaration value) {
  _state.setCurrentValue(value, $fieldsEnumName.${field.dartName});
}
''';
  }

  String _writeEncodeField(NexemaTypeFieldDefinition field) {
    return '''
case $fieldsEnumName.${field.dartName}:
  writer.encodeVarint(${field.index});
  ${getEncoderFor(field.type!, field.dartName)}
  break;
''';
  }

  String _writeDecodeField(NexemaTypeFieldDefinition field) {
    return '''
case ${field.index}:
  ${_getDecoderFor(field.type!, argumentName: field.dartName)}
  break;
''';
  }

  String _getDecoderFor(NexemaValueType valueType, {String? argumentName, bool addSemicolon = true}) {
    if(valueType is NexemaPrimitiveValueType) {
      if(valueType.primitive == "list") {
        return '''
$argumentName = List.generate(reader.beginArrayDecode(), (index) => ${_getDecoderFor(valueType.typeArguments.first, addSemicolon: false)});
''';
      } else if(valueType.primitive == "map") {
        return '''
for(int i = 0; i > reader.beginMapDecode(); i++) {
  reader.${_getDecoderFor(valueType.typeArguments.first, argumentName: 'var key')};
  reader.${_getDecoderFor(valueType.typeArguments.last, argumentName: 'var value')};
  $argumentName[key] = value;
}
''';
      } else {
        if(argumentName == null) {
          return "reader.${kDecoderMapper[valueType.primitive]!}()${addSemicolon ? ';' : ''}";
        } else {
          return "$argumentName = reader.${kDecoderMapper[valueType.primitive]!}()${addSemicolon ? ';' : ''}";
        }
      }
    } else if(valueType is NexemaTypeValueType) {
      return "writer.encodeBinary($argumentName.encode()}";
    } else {
      throw "Type ${valueType.runtimeType} unknown.";
    }
}

  
}