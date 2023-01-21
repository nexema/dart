// import 'dart:typed_data';

// import 'package:benchmark_harness/benchmark_harness.dart';

// import '../test/types/example_enum_type.dart';
// import '../test/types/example_struct.dart';
// import '../test/types/example_union.dart';

// class DeserializeBenchmark extends BenchmarkBase {
//   DeserializeBenchmark() : super('Deserialize');

//   static void main() {
//     DeserializeBenchmark().report();
//   }

//   late Uint8List buffer;

//   @override
//   void run() {
//     ExampleStruct.fromBuffer(buffer);
//   }

//   @override
//   void setup() {
//     buffer = ExampleStruct(
//       name: "hello world",
//       names: ["a", "b", "goodbye world"],
//       config: {
//         "another": 12245615348513841,
//         "min": -215154153153,
//         "max": 1
//       },
//       anotherStruct: AnotherStruct(
//         name: "another struct name",
//         myEnum: ExampleEnumType.third
//       ),
//       myUnion: ExampleUnion.age(55)
//     ).serialize();
//   }

//   @override
//   void teardown() {}

//   // To opt into the reporting the time per run() instead of per 10 run() calls.
//   //@override
//   //void exercise() => run();
// }

// void main() {
//   DeserializeBenchmark.main();
// }