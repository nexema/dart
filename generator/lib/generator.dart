import 'package:nexema_generator/models.dart';
import 'package:nexema_generator/union_generator.dart';

class Generator {
  static late final Generator defaultGenerator;

  final NexemaDefinition definition;
  final Map<String, TypeReference> _types = {};

  Generator(this.definition) {
    defaultGenerator = this;
  }

  void generate() {
    _scan();
    
    for(var file in definition.files) {
      for(var type in file.types) {
        if(type.modifier == "union") {
          print(UnionGenerator(type).generate());
        }
      }
    }
  }

  void _scan() {
    for(var file in definition.files) {
      for(var type in file.types) {
        _types[type.id] = TypeReference(type: type, path: file.name); 
      }
    }
  }

  TypeReference resolve(String typeId) {
    return _types[typeId]!;
  }
}

class TypeReference {
  final NexemaTypeDefinition type;
  final String path;

  TypeReference({required this.type, required this.path});
}