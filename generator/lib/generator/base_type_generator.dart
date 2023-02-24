import 'package:nexema_generator/models.dart';

abstract class BaseTypeGenerator {
  final NexemaTypeDefinition type;

  BaseTypeGenerator({required this.type});

  String generate();
}