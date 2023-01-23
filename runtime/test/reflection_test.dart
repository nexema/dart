import 'dart:typed_data';

import 'package:nexema/nexema.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group("test reflection", () {
    test("test hashcode and equality operations", () {
      User user = User(
        firstName: "Tomás",
        lastName: "Weigenast",
        tags: ["tomas", "weigenast"]
      );

      var other = User.decode(user.encode());   
      expect(other.hashCode, user.hashCode);
      expect(other, equals(user));

      expect(User.fields.firstName.evaluate(user), "Tomás");
      expect(User.fields.lastName.evaluate(user), "Weigenast");
      expect(User.fields.tags.evaluate(user), ["tomas", "weigenast"]);
    });
  });
}

class User extends NexemaType {
  static final _UserFields fields = _UserFields();

  final NexemaTypeState<User> _state;

  User._empty() : _state = NexemaTypeState([null, null, null]), super();
  User._internal(Iterable<dynamic> values) : _state = NexemaTypeState(values.toList(growable: false)), super();

  factory User({
    required String firstName,
    required String lastName,
    required List<String> tags
  }) {
    return User._internal([firstName,lastName,tags]);
  }

  factory User.decode(Uint8List buffer) {
    var instance = User._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  String get firstName => _state.get(0) as String;
  String get lastName => _state.get(1) as String;
  List<String> get tags => _state.get(2) as List<String>;

  set firstName(String value) {
    _state.set(0, value);
  }

  set lastName(String value) {
    _state.set(1, value);
  }

  set tags(List<String> value) {
    _state.set(2, value);
  }

  @override
  Uint8List encode() {
    var writer = getWriter();
    writer.encodeString(firstName);
    writer.encodeString(lastName);
    writer.beginArray(tags.length);
    for(var elem in tags) {
      writer.encodeString(elem);
    }

    return writer.takeBytes();
  }
  
  @override
  void mergeFrom(Uint8List buffer) {
    var reader = getReader(buffer);
    _state.setAll([
      reader.decodeString(),
      reader.decodeString(),
      List.generate(reader.beginDecodeArray(), (index) => reader.decodeString())
    ]);
  }

  @override
  int get hashCode => _state.hashCode;
  
  @override
  bool operator ==(Object other) {
    if(other is! User) {
      return false;
    }

    return other._state == _state;
  }

  @override
  String toString() => "User(firstName: $firstName, lastName: $lastName, tags: $tags)";
} 

class _UserFields {
  _UserFields();

  // ignore: prefer_function_declarations_over_variables
  static final StateGetter<User> _stateGetter = (user) => user._state;

  final firstName = FieldInfo<User>(_stateGetter, name: "first_name", dartName: "firstName", index: 0, valueType: const FieldValueType(isNullable: false, kind: FieldValueKind.string, typeArguments: null));
  final lastName = FieldInfo<User>(_stateGetter, name: "last_name", dartName: "lastName", index: 1, valueType: const FieldValueType(isNullable: false, kind: FieldValueKind.string, typeArguments: null));
  final tags = FieldInfo<User>(_stateGetter, name: "tags", dartName: "tags", index: 2, valueType: const FieldValueType(typeArguments: [FieldValueType(kind: FieldValueKind.string, isNullable: false, typeArguments: null)], kind: FieldValueKind.list, isNullable: false));
}