import 'package:nexema_generator/enum_generator.dart';
import 'package:nexema_generator/models.dart';

class Generator {
  final NexemaDefinition definition;

  Generator(this.definition);

  void generate() {
    for(var file in definition.files) {
      for(var type in file.types) {
        if(type.modifier == "enum") {
          print(EnumGenerator(type).generate());
        }
      }
    }
  }
}