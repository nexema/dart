String mapNewlineJoin<T>(List<T> list, String Function(T item) mapper, {String beforeNewline = ""}) {
  return list.map(mapper).join("$beforeNewline\n");
}