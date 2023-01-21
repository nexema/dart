import 'package:nexema_dart_generator/models.dart';

class Sanitizer {
  const Sanitizer._();

  static const _keywords = <String>[
    "null",
    "required",
    "final",
    "class",
    "void",
    "const",
    "static",
    "extends",
    "implements",
    "enum",
    "mixin"
  ];

  static void sanitize(DeclarationNode root) {
    for(var child in root.children) {
      if(child.value is FileDeclaration) {
        for(var type in (child.value as FileDeclaration).types) {
          for(var field in type.fields) {
            if(_keywords.contains(field.name)) {
              // field.name = "${field.name}\$";
              int index = type.fields.indexOf(field);
              type.fields.removeAt(index);
              type.fields.insert(index, field.copyWith(name: "${field.name}\$"));              
            }
          }
        }
      } else {
        sanitize(child);
      }
    }
  }
}