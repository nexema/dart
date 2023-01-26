import 'package:nexema_generator/models.dart';

NexemaTypeFieldDefinition getField(int index, String name, NexemaValueType valueType, {Map<String, Object?>? metadata, Object? defaultValue}) 
  => NexemaTypeFieldDefinition(
    index: index, 
    name: name, 
    metadata: metadata ?? const {}, 
    defaultValue: defaultValue, 
    type: valueType
  );

NexemaTypeFieldDefinition getEnumField(int index, String name) 
  => NexemaTypeFieldDefinition(
    index: index, 
    name: name, 
    metadata: const {}, 
    defaultValue: null, 
    type: null
  );

NexemaValueType getPrimitiveValueType(String primitive, [bool nullable = false])
  => NexemaPrimitiveValueType(
    nullable: nullable, 
    primitive: primitive, 
    typeArguments: []
  );

NexemaValueType getListValueType(NexemaValueType typeArgument, [bool nullable = false])
  => NexemaPrimitiveValueType(
    nullable: nullable, 
    primitive: "list", 
    typeArguments: [typeArgument]
  );

NexemaValueType getMapValueType(NexemaValueType keyType, NexemaValueType valueType, [bool nullable = false])
  => NexemaPrimitiveValueType(
    nullable: nullable, 
    primitive: "map", 
    typeArguments: [keyType, valueType]
  );

NexemaValueType getTypeValueType(String typeId, [bool nullable = false])
  => NexemaTypeValueType(
    nullable: nullable, 
    typeId: typeId,
    importAlias: null
  );
