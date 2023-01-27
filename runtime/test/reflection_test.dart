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
        tags: ["tomas", "weigenast"],
        accountType: AccountType.administrator,
        accountDetails: AccountDetails(
          enabled: true
        )
      );

      var other = User.decode(user.encode());   
      expect(other.hashCode, user.hashCode);
      expect(other, equals(user));

      expect(User.fields.firstName.evaluate(user), "Tomás");
      expect(User.fields.lastName.evaluate(user), "Weigenast");
      expect(User.fields.tags.evaluate(user), ["tomas", "weigenast"]);

      user.lastName = "A";
      expect(user.lastName, equals("A"));

      user.accountDetails.name = "Hello";
      expect(user.accountDetails.whichField, equals(AccountDetailsField.name));
      expect(user.accountDetails.name, equals("Hello"));
      expect(user.accountDetails.hasValue, isTrue);
      expect(() => user.accountDetails.enabled, throwsA(isA<UnionNotSetError>()));

      user.accountDetails.clear();
      expect(user.accountDetails.hasValue, isFalse);
      expect(user.accountDetails.whichField, equals(AccountDetailsField.notSet));
    });

    test("enums", () {
      var unknown = AccountType.unknown;
      expect(unknown, equals(AccountType.unknown));
      expect(unknown.hashCode, equals(AccountType.unknown.hashCode));
      expect(unknown, isNot(equals(AccountType.administrator)));
      expect(AccountType.byIndex(2), AccountType.customer);
      expect(AccountType.byIndex(5), isNull);
      expect(AccountType.byName("administrator"), AccountType.administrator);
      expect(AccountType.byName("s"), isNull);
    }); 
  });
}

class User extends NexemaType {
  static final _UserFields fields = _UserFields();

  final StructTypeState<User> _state;

  User._empty() : _state = StructTypeState([null, null, null, null]), super();
  User._internal(Iterable<dynamic> values) : _state = StructTypeState(values.toList(growable: false)), super();

  factory User({
    required String firstName,
    required String lastName,
    required List<String> tags,
    AccountType? accountType,
    required AccountDetails accountDetails
  }) {
    accountType ??= AccountType.unknown;
    return User._internal([firstName,lastName,tags,accountType,accountDetails]);
  }

  factory User.decode(Uint8List buffer) {
    var instance = User._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  String get firstName => _state.get(0) as String;
  String get lastName => _state.get(1) as String;
  List<String> get tags => _state.get(2) as List<String>;
  AccountType get accountType => _state.get(3) as AccountType;
  AccountDetails get accountDetails => _state.get(4) as AccountDetails;
 
  set firstName(String value) {
    _state.set(0, value);
  }

  set lastName(String value) {
    _state.set(1, value);
  }

  set tags(List<String> value) {
    _state.set(2, value);
  }

  set accountType(AccountType value) {
    _state.set(3, value);
  }

  set accountDetails(AccountDetails value) {
    _state.set(4, value);
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
    writer.encodeUint8(accountType.index);
    writer.encodeBinary(accountDetails.encode());

    return writer.takeBytes();
  }
  
  @override
  void mergeFrom(Uint8List buffer) {
    var reader = getReader(buffer);
    _state.setAll([
      reader.decodeString(),
      reader.decodeString(),
      List.generate(reader.beginDecodeArray(), (index) => reader.decodeString()),
      AccountType.byIndex(reader.decodeUint8()) ?? AccountType.unknown,
      AccountDetails.decode(reader.decodeBinary())
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
  String toString() => "User(firstName: $firstName, lastName: $lastName, tags: $tags, accountType: $accountType, accountDetails: $accountDetails)";
} 

class _UserFields {
  _UserFields();

  // ignore: prefer_function_declarations_over_variables
  static final StateGetter<StructTypeState<User>, User> _stateGetter = (user) => user._state;

  final firstName = FieldInfo<User>(_stateGetter, name: "first_name", dartName: "firstName", index: 0, valueType: const FieldValueType(isNullable: false, kind: FieldValueKind.string, typeArguments: null));
  final lastName = FieldInfo<User>(_stateGetter, name: "last_name", dartName: "lastName", index: 1, valueType: const FieldValueType(isNullable: false, kind: FieldValueKind.string, typeArguments: null));
  final tags = FieldInfo<User>(_stateGetter, name: "tags", dartName: "tags", index: 2, valueType: const FieldValueType(typeArguments: [FieldValueType(kind: FieldValueKind.string, isNullable: false, typeArguments: null)], kind: FieldValueKind.list, isNullable: false));
}

class AccountType extends NexemaEnumType {

  final String _name;
  final int _index;

  const AccountType._internal(this._name, this._index);

  static const AccountType unknown = AccountType._internal("unknown", 0); 
  static const AccountType administrator = AccountType._internal("administrator", 1); 
  static const AccountType customer = AccountType._internal("customer", 2); 

  int get index => _index;
  String get name => _name;

  static AccountType? byIndex(int index) {
    try {
      return values[index];
    } catch(_) {
      return null;
    }
  }

  static AccountType? byName(String name) {
    return _map[name];
  }

  static const List<AccountType> values = [unknown, administrator, customer];
  static const _map = <String, AccountType>{
    "unknown": unknown,
    "administrator": administrator,
    "customer": customer
  };

  @override
  Uint8List encode() {
    var writer = getWriter(1);
    writer.encodeUint8(_index);
    return writer.takeBytes();
  }

  @override
  int get hashCode => _index;
  
  @override
  bool operator ==(Object other) {
    if(other is! AccountType) {
      return false;
    }

    return other._index == _index;
  }

  @override
  String toString() => "AccountType($_name: $_index)";
}

class AccountDetails extends NexemaType {

  final UnionTypeState<AccountDetails, AccountDetailsField> _state;

  AccountDetails._empty() : _state = UnionTypeState(null, AccountDetailsField.notSet);
  AccountDetails._(dynamic value, AccountDetailsField field) : _state = UnionTypeState(value, field);

  AccountDetailsField get whichField => _state.currentField;
  bool get hasValue => _state.currentField != AccountDetailsField.notSet;

  factory AccountDetails.name({required String name}) {
    return AccountDetails._(name, AccountDetailsField.name);
  }

  factory AccountDetails.enabled({required bool enabled}) {
    return AccountDetails._(enabled, AccountDetailsField.enabled);
  }

  factory AccountDetails.decode(Uint8List buffer) {
    var empty = AccountDetails._empty();
    empty.mergeFrom(buffer);
    return empty;
  }

  factory AccountDetails({
    String? name,
    bool? enabled
  }) {
    if(name != null) {
      return AccountDetails.name(name: name);
    } 

    if(enabled != null) {
      return AccountDetails.enabled(enabled: enabled);
    }

    return AccountDetails._(null, AccountDetailsField.notSet);
  }

  String get name => _state.get<String>(AccountDetailsField.name);
  bool get isName => _state.currentField == AccountDetailsField.name;

  bool get enabled => _state.get<bool>(AccountDetailsField.enabled);
  bool get isEnabled => _state.currentField == AccountDetailsField.enabled;

  set name(String value) {
    _state.setCurrentValue(value, AccountDetailsField.name);
  }

  set enabled(bool value) {
    _state.setCurrentValue(value, AccountDetailsField.enabled);
  }

  void clear() {
    _state.setCurrentValue(null, AccountDetailsField.notSet);
  }

  @override
  Uint8List encode() {
    var writer = getWriter();
    switch(_state.currentField) {
      case AccountDetailsField.notSet:
        writer.encodeNull();
        break;

      case AccountDetailsField.name:
        writer.encodeVarint(0);
        writer.encodeString(name);
        break;

      case AccountDetailsField.enabled:
        writer.encodeVarint(1);
        writer.encodeBool(enabled);
        break;
    }

    return writer.takeBytes();
  }

  @override
  void mergeFrom(Uint8List buffer) {
    var reader = getReader(buffer);
    if(reader.isNextNull()) {
      clear();
      return;
    } else {
      int field = reader.decodeVarint();
      switch(field) {
        case 0:
          name = reader.decodeString();
          break;

        case 1:
          enabled = reader.decodeBool();
          break;
      }
    }
  }

  @override
  int get hashCode => _state.hashCode;
  
  @override
  bool operator ==(Object other) {
    if(other is! AccountDetails) {
      return false;
    }

    return other._state == _state;
  }
}

enum AccountDetailsField {
  notSet,
  name,
  enabled
}