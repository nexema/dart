class Tuple<T1, T2> {
  final T1 first;
  final T2 second;

  const Tuple(this.first, this.second);
}

Tuple<T1, T2> tuple<T1, T2>(T1 first, T2 second) => Tuple(first, second);