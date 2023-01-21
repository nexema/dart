class TestCase<TInput, TExpect> {
  final String description;
  final TInput input;
  final TExpect expect;

  TestCase(this.description, this.input, this.expect);
}