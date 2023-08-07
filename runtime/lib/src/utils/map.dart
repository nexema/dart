@pragma('vm:prefer-inline')
Map<K, V> generateMap<K extends Comparable, V>(
    int length, K Function(int index) keyGetter, V Function(int index) valueGetter) {
  final map = <K, V>{};
  for (int i = 0; i < length; i++) {
    map[keyGetter(i)] = valueGetter(i);
  }

  return map;
}
