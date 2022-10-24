import 'dart:typed_data';


abstract class SchemaType<T extends SchemaType<T>> {

  const SchemaType();

  /// Deep clones the current T instance.
  T clone();

  /// Deserializes a [Uint8List] and merges to the current type.
  void mergeFrom(Uint8List buffer);

  /// Merges the current type instance with other instance.
  void mergeUsing(T other);

  /// Serializes the current type to a Uint8List
  Uint8List serialize();
}