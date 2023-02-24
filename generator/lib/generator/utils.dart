String mapNewlineJoin<T>(List<T> list, String Function(T item) mapper) {
  return list.map(mapper).join("\n");
}