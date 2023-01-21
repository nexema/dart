import 'package:code_builder/code_builder.dart';
import 'package:nexema_dart_generator/models.dart';
import 'package:nexema_dart_generator/primitive_mapper.dart';

String structDefault(String structName) => "$structName()";

String unionDefault(String unionName) => "$unionName.empty()";

TypeReference createTypeReference(Reference type, List<Reference> typeArguments) {
  return TypeReference((builder) {
    builder.symbol = type.symbol;
    builder.url = type.url;
    builder.types.addAll(typeArguments);
  });
}

TypeReference buildListReference(SchemaFieldType typeArgument) {
  return TypeReference((b) {
    b.symbol = "List";
    
    var typeArgReference = PrimitiveMapper.typeReferences[typeArgument.primitive]!;
    if(typeArgument.nullable) {
      typeArgReference = typeArgReference.asNullable;
    }
    
    b.types.add(typeArgReference);
  }).type;
}

TypeReference buildMapReference(SchemaFieldType keyTypeArgument, SchemaFieldType valueTypeArgument) {
  return TypeReference((b) {
    b.symbol = "Map";
    
    var keyArgReference = PrimitiveMapper.typeReferences[keyTypeArgument.primitive]!;
    if(keyTypeArgument.nullable) {
      keyArgReference = keyArgReference.asNullable;
    }
    
    b.types.add(keyArgReference);

    var valueArgReference = PrimitiveMapper.typeReferences[valueTypeArgument.primitive]!;
    if(valueTypeArgument.nullable) {
      valueArgReference = valueArgReference.asNullable;
    }
    
    b.types.add(valueArgReference);
  });
}

extension ReferenceExtensions on Reference {
  Reference get asNullable => refer("$symbol?", url);
}