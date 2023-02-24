import 'package:nexema_generator/models.dart';

NexemaTypeFieldDefinition getField(int index, String name, NexemaValueType valueType, {Map<String, dynamic>? metadata, Object? defaultValue}) 
  => NexemaTypeFieldDefinition(
    index: index, 
    name: name, 
    defaults: {},
    annotations: {},
    type: valueType
  );

NexemaTypeFieldDefinition getEnumField(int index, String name) 
  => NexemaTypeFieldDefinition(
    index: index, 
    name: name, 
    defaults: {},
    annotations: {},
    type: null
  );

NexemaValueType getPrimitiveValueType(String primitive, [bool nullable = false])
  => NexemaPrimitiveValueType(
    nullable: nullable, 
    primitive: primitive, 
    arguments: []
  );

NexemaValueType getListValueType(NexemaValueType typeArgument, [bool nullable = false])
  => NexemaPrimitiveValueType(
    nullable: nullable, 
    primitive: "list", 
    arguments: [typeArgument]
  );

NexemaValueType getMapValueType(NexemaValueType keyType, NexemaValueType valueType, [bool nullable = false])
  => NexemaPrimitiveValueType(
    nullable: nullable, 
    primitive: "map", 
    arguments: [keyType, valueType]
  );

NexemaValueType getTypeValueType(int typeId, [bool nullable = false])
  => NexemaTypeValueType(
    nullable: nullable, 
    objectId: typeId,
  );
