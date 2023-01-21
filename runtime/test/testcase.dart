import 'package:test/scaffolding.dart';
import 'package:test/test.dart';

class TestCase<TInput, TExpect> {
  final String description;
  final TInput input;
  final TExpect expect;
  final Object? error;

  TestCase(this.description, this.input, this.expect, [this.error]);
}

class TestCaseRunner {
  final List<TestCase> tests;

  TestCaseRunner(this.tests);

  void run(void Function(TestCase testcase) runner) {
    for (var element in tests) { 
      test("${element.description} -> ${element.expect}", () {
        runner(element);
      });
    }
  }
}