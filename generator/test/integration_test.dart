import 'dart:io';

import 'package:nexema_generator/generator/generator.dart';
import 'package:nexema_generator/models.dart';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';

void main() {
  test("integration test", () {
    /*
    The snapshot test will represent the following tree structure:
    nexema.yaml
    common/
      foo.nex -> FooStruct(1), FooUnion(2)
      bar.nex -> BarEnum(3), BarBase(7)
    another/
      baz.nex -> BazEnum(4)
      nested/
        ted.nex -> TedUnion(5), TedStruct(6)


    foo.nex will import another/baz.nex and another/nested/ted.nex
    ted.nex will import bar.nex
    */

    try {
      Directory("./example/lib/generated").deleteSync(recursive: true);
    } catch (_) {}

    final snapshot = NexemaSnapshot.fromJson(File("./example/snapshot.nexs").readAsStringSync());

    final generator = Generator(
        snapshot: snapshot,
        settings:
            GeneratorSettings(outputPath: "example/lib/generated", projectName: "example.com"));

    final result = generator.run();
    expect(result.error, isNull);
    expect(result.exitCode, equals(0));
    expect(result.files, hasLength(4));
    for (var file in result.files) {
      final p = path.join("example/lib/generated", file.filePath);
      File(p)
        ..createSync(recursive: true)
        ..writeAsStringSync(file.contents);
    }
  });
}
