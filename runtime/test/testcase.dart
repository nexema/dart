import 'package:test/scaffolding.dart';

class TestCase<TInput, TExpect> {
  final String description;
  final TInput input;
  final TExpect expect;

  TestCase(this.description, this.input, this.expect);
}

class TestCaseErr<TInput, TExpect> extends TestCase {
  final Object? error;
  TestCaseErr(super.description, super.input, super.expect, this.error);
}

class TestCaseRunner {
  final List<TestCase> tests;

  TestCaseRunner(this.tests);

  void run(void Function(TestCase testcase) runner) {
    // ignore: avoid_function_literals_in_foreach_calls
    tests.forEach((element) { 
      test("${element.description} -> ${element.expect}", () {
        runner(element);
      });
    });
  }
}