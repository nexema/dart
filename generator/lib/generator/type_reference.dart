import 'package:nexema_generator/models.dart';

class TypeReference {
  final String importAlias;
  final NexemaTypeDefinition type;
  final String path;

  TypeReference({required this.type, required this.path, required this.importAlias});
}