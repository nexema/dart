import 'package:collection/collection.dart';

const kDeepCollectionEquality = DeepCollectionEquality();

Map<K, V> generateMap<K, V>(int length, K Function() key, V Function() value) {
  var out = <K, V>{};
  for(int i = 0; i<length; i++) {
    out[key()] = value();
  }

  return out;
}