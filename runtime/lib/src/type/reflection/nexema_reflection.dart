part of '../nexema_type.dart';

/// Base class for every type that can be used to do some kind of runtime reflection over Nexema types.
abstract class NexemaReflection<TType extends NexemaType> {
  /// Evaluates the current type and returns an object.
  Object? evaluate(TType instance);

  const NexemaReflection();
}