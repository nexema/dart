import 'package:nexema/nexema.dart' as $nex;
import 'dart:typed_data' as $td;
import 'dart:core' as $core;
import '../common/entity.nex.dart' as $entity;
import 'user.nex.dart' as $user;
import '../common/location/address.nex.dart' as $address;

class CustomerAccount extends $nex.NexemaType {
  final $nex.StructTypeState<CustomerAccount> _state;
  @$core.override
  $nex.NexemaTypeState<CustomerAccount> get $state_ => _state;

  static const _typeInfo = $nex.TypeInfo(
      name: 'CustomerAccount',
      modifier: $nex.TypeModifier.struct,
      packageName: 'identity',
      annotations: {},
      fields: [
        $nex.FieldInfo<CustomerAccount>(
            name: 'dni',
            dartName: 'dni',
            index: 0,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.string,
                isNullable: false,
                typeArguments: []),
            annotations: {})
      ]);

  CustomerAccount._internal($core.Iterable<$core.dynamic> values)
      : _state = $nex.StructTypeState(values.toList(growable: false)),
        super(_typeInfo);

  CustomerAccount._empty()
      : _state = $nex.StructTypeState([null]),
        super(_typeInfo);

  factory CustomerAccount({required $core.String dni}) {
    return CustomerAccount._internal([dni]);
  }

  factory CustomerAccount.decode($td.Uint8List buffer) {
    var instance = CustomerAccount._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  $core.String get dni => _state.get(0) as $core.String;

  set dni($core.String value) {
    _state.set(0, value);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();

    writer.encodeString(dni);
    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    final reader = $nex.getReader(buffer);
    _state.setAll([reader.decodeString()]);
  }

  @$core.override
  $core.int get hashCode => _state.hashCode;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! CustomerAccount) {
      return false;
    }

    return other._state == _state;
  }

  @$core.override
  $core.String toString() => 'CustomerAccount(dni: $dni)';
}

class EmployeeAccount extends $nex.NexemaType {
  final $nex.StructTypeState<EmployeeAccount> _state;
  @$core.override
  $nex.NexemaTypeState<EmployeeAccount> get $state_ => _state;

  static const _typeInfo = $nex.TypeInfo(
      name: 'EmployeeAccount',
      modifier: $nex.TypeModifier.struct,
      packageName: 'identity',
      annotations: {},
      fields: [
        $nex.FieldInfo<EmployeeAccount>(
            name: 'permissions',
            dartName: 'permissions',
            index: 0,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.list,
                isNullable: false,
                typeArguments: [
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.string,
                      isNullable: false,
                      typeArguments: [])
                ]),
            annotations: {})
      ]);

  EmployeeAccount._internal($core.Iterable<$core.dynamic> values)
      : _state = $nex.StructTypeState(values.toList(growable: false)),
        super(_typeInfo);

  EmployeeAccount._empty()
      : _state = $nex.StructTypeState([null]),
        super(_typeInfo);

  factory EmployeeAccount({required $core.List<$core.String> permissions}) {
    return EmployeeAccount._internal([permissions]);
  }

  factory EmployeeAccount.decode($td.Uint8List buffer) {
    var instance = EmployeeAccount._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  $core.List<$core.String> get permissions =>
      _state.get(0) as $core.List<$core.String>;

  set permissions($core.List<$core.String> value) {
    _state.set(0, value);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();

    writer.beginArray(permissions.length);
    for (var value in permissions) {
      writer.encodeString(value);
    }
    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    final reader = $nex.getReader(buffer);
    _state.setAll([
      $core.List.generate(
          reader.beginDecodeArray(), (_) => reader.decodeString())
    ]);
  }

  @$core.override
  $core.int get hashCode => _state.hashCode;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! EmployeeAccount) {
      return false;
    }

    return other._state == _state;
  }

  @$core.override
  $core.String toString() => 'EmployeeAccount(permissions: $permissions)';
}

class AdminAccount extends $nex.NexemaType {
  final $nex.StructTypeState<AdminAccount> _state;
  @$core.override
  $nex.NexemaTypeState<AdminAccount> get $state_ => _state;

  static const _typeInfo = $nex.TypeInfo(
      name: 'AdminAccount',
      modifier: $nex.TypeModifier.struct,
      packageName: 'identity',
      annotations: {},
      fields: [
        $nex.FieldInfo<AdminAccount>(
            name: 'full_access',
            dartName: 'fullAccess',
            index: 0,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.bool,
                isNullable: false,
                typeArguments: []),
            annotations: {})
      ]);

  AdminAccount._internal($core.Iterable<$core.dynamic> values)
      : _state = $nex.StructTypeState(values.toList(growable: false)),
        super(_typeInfo);

  AdminAccount._empty()
      : _state = $nex.StructTypeState([null]),
        super(_typeInfo);

  factory AdminAccount({required $core.bool fullAccess}) {
    return AdminAccount._internal([fullAccess]);
  }

  factory AdminAccount.decode($td.Uint8List buffer) {
    var instance = AdminAccount._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  $core.bool get fullAccess => _state.get(0) as $core.bool;

  set fullAccess($core.bool value) {
    _state.set(0, value);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();

    writer.encodeBool(fullAccess);
    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    final reader = $nex.getReader(buffer);
    _state.setAll([reader.decodeBool()]);
  }

  @$core.override
  $core.int get hashCode => _state.hashCode;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! AdminAccount) {
      return false;
    }

    return other._state == _state;
  }

  @$core.override
  $core.String toString() => 'AdminAccount(fullAccess: $fullAccess)';
}

class User extends $entity.Entity {
  final $nex.StructTypeState<User> _state;
  @$core.override
  $nex.NexemaTypeState<User> get $state_ => _state;

  static const _typeInfo = $nex.TypeInfo(
      name: 'User',
      modifier: $nex.TypeModifier.struct,
      packageName: 'identity',
      annotations: {},
      fields: [
        $nex.FieldInfo<User>(
            name: 'first_name',
            dartName: 'firstName',
            index: 4,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.string,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<User>(
            name: 'last_name',
            dartName: 'lastName',
            index: 5,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.string,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<User>(
            name: 'email',
            dartName: 'email',
            index: 6,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.string,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<User>(
            name: 'tags',
            dartName: 'tags',
            index: 7,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.list,
                isNullable: true,
                typeArguments: [
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.string,
                      isNullable: true,
                      typeArguments: [])
                ]),
            annotations: {'obsolete': true}),
        $nex.FieldInfo<User>(
            name: 'preferences',
            dartName: 'preferences',
            index: 8,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.map,
                isNullable: false,
                typeArguments: [
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.string,
                      isNullable: false,
                      typeArguments: []),
                  $nex.FieldValueType(
                      kind: $nex.FieldValueKind.bool,
                      isNullable: true,
                      typeArguments: [])
                ]),
            annotations: {
              'header': ["hola"]
            }),
        $nex.FieldInfo<User>(
            name: 'account_type',
            dartName: 'accountType',
            index: 9,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.type,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<User>(
            name: 'account_details',
            dartName: 'accountDetails',
            index: 10,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.type,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<User>(
            name: 'address',
            dartName: 'address',
            index: 11,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.type,
                isNullable: false,
                typeArguments: []),
            annotations: {})
      ]);

  User._internal($core.Iterable<$core.dynamic> values)
      : _state = $nex.StructTypeState(values.toList(growable: false)),
        super(_typeInfo);

  User._empty()
      : _state = $nex.StructTypeState(
            [null, null, null, null, null, null, null, null]),
        super(_typeInfo);

  factory User(
      {required $core.String id,
      required $core.DateTime createdAt,
      $core.DateTime? deletedAt,
      $core.DateTime? modifiedAt,
      $core.String firstName = "Tomas",
      required $core.String lastName,
      required $core.String email,
      $core.List<$core.String?>? tags,
      $core.Map<$core.String, $core.bool?> preferences = const {
        'cats': false,
        'dogs': true
      },
      required $user.AccountType accountType,
      required $user.AccountDetails accountDetails,
      required $address.Address address}) {
    return User._internal([
      id,
      createdAt,
      deletedAt,
      modifiedAt,
      firstName,
      lastName,
      email,
      tags,
      preferences,
      accountType,
      accountDetails,
      address
    ]);
  }

  factory User.decode($td.Uint8List buffer) {
    var instance = User._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  $core.String get firstName => _state.get(4) as $core.String;

  set firstName($core.String value) {
    _state.set(4, value);
  }

  $core.String get lastName => _state.get(5) as $core.String;

  set lastName($core.String value) {
    _state.set(5, value);
  }

  $core.String get email => _state.get(6) as $core.String;

  set email($core.String value) {
    _state.set(6, value);
  }

  /// List of tags

  $core.List<$core.String?>? get tags =>
      _state.get(7) as $core.List<$core.String?>?;

  set tags($core.List<$core.String?>? value) {
    _state.set(7, value);
  }

  $core.Map<$core.String, $core.bool?> get preferences =>
      _state.get(8) as $core.Map<$core.String, $core.bool?>;

  set preferences($core.Map<$core.String, $core.bool?> value) {
    _state.set(8, value);
  }

  $user.AccountType get accountType => _state.get(9) as $user.AccountType;

  set accountType($user.AccountType value) {
    _state.set(9, value);
  }

  $user.AccountDetails get accountDetails =>
      _state.get(10) as $user.AccountDetails;

  set accountDetails($user.AccountDetails value) {
    _state.set(10, value);
  }

  $address.Address get address => _state.get(11) as $address.Address;

  set address($address.Address value) {
    _state.set(11, value);
  }

  @$core.override
  $core.String get id => _state.get(0) as $core.String;

  @$core.override
  set id($core.String value) {
    _state.set(0, value);
  }

  @$core.override
  $core.DateTime get createdAt => _state.get(1) as $core.DateTime;

  @$core.override
  set createdAt($core.DateTime value) {
    _state.set(1, value);
  }

  @$core.override
  $core.DateTime? get deletedAt => _state.get(2) as $core.DateTime?;

  @$core.override
  set deletedAt($core.DateTime? value) {
    _state.set(2, value);
  }

  @$core.override
  $core.DateTime? get modifiedAt => _state.get(3) as $core.DateTime?;

  @$core.override
  set modifiedAt($core.DateTime? value) {
    _state.set(3, value);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();
    writer.encodeString(id);
    writer.encodeTimestamp(createdAt);
    if (deletedAt == null) {
      writer.encodeNull();
    } else {
      writer.encodeTimestamp(deletedAt!);
    }
    if (modifiedAt == null) {
      writer.encodeNull();
    } else {
      writer.encodeTimestamp(modifiedAt!);
    }
    writer.encodeString(firstName);
    writer.encodeString(lastName);
    writer.encodeString(email);
    if (tags == null) {
      writer.encodeNull();
    } else {
      writer.beginArray(tags!.length);
      for (var value in tags!) {
        if (value == null) {
          writer.encodeNull();
        } else {
          writer.encodeString(value);
        }
      }
    }
    writer.beginMap(preferences.length);
    for (var entry in preferences.entries) {
      writer.encodeString(entry.key);
      if (entry.value == null) {
        writer.encodeNull();
      } else {
        writer.encodeBool(entry.value!);
      }
    }
    writer.encodeUint8(accountType.index);
    writer.encodeBinary(accountDetails.encode());
    writer.encodeBinary(address.encode());
    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    final reader = $nex.getReader(buffer);
    _state.setAll([
      reader.decodeString(),
      reader.decodeTimestamp(),
      reader.isNextNull() ? null : (reader.decodeTimestamp()),
      reader.isNextNull() ? null : (reader.decodeTimestamp()),
      reader.decodeString(),
      reader.decodeString(),
      reader.decodeString(),
      reader.isNextNull()
          ? null
          : ($core.List.generate(reader.beginDecodeArray(),
              (_) => reader.isNextNull() ? null : (reader.decodeString()))),
      $nex.generateMap(reader.beginDecodeMap(), (_) => reader.decodeString(),
          (_) => reader.isNextNull() ? null : (reader.decodeBool())),
      $user.AccountType.byIndex(reader.decodeUint8()) ??
          $user.AccountType.unknown,
      $user.AccountDetails.decode(reader.decodeBinary()),
      $address.Address.decode(reader.decodeBinary())
    ]);
  }

  @$core.override
  $core.int get hashCode => _state.hashCode;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! User) {
      return false;
    }

    return other._state == _state;
  }

  @$core.override
  $core.String toString() =>
      'User(firstName: $firstName, lastName: $lastName, email: $email, tags: $tags, preferences: $preferences, accountType: $accountType, accountDetails: $accountDetails, address: $address)';
}

class AccountType extends $nex.NexemaEnumType {
  final $core.int _index;
  final $core.String _name;

  @$core.override
  $nex.NexemaTypeState<AccountType> get $state_ =>
      throw $core.UnsupportedError('Enum types does not have state.');
  static const _typeInfo = $nex.TypeInfo(
      name: 'AccountType',
      modifier: $nex.TypeModifier.enumerator,
      packageName: 'identity',
      annotations: {},
      fields: [
        $nex.FieldInfo<AccountType>(
            name: 'unknown',
            dartName: 'unknown',
            index: 0,
            valueType: null,
            annotations: {}),
        $nex.FieldInfo<AccountType>(
            name: 'admin',
            dartName: 'admin',
            index: 1,
            valueType: null,
            annotations: {}),
        $nex.FieldInfo<AccountType>(
            name: 'employee',
            dartName: 'employee',
            index: 2,
            valueType: null,
            annotations: {}),
        $nex.FieldInfo<AccountType>(
            name: 'customer',
            dartName: 'customer',
            index: 3,
            valueType: null,
            annotations: {})
      ]);

  $core.int get index => _index;
  $core.String get name => _name;

  const AccountType._internal(this._name, this._index) : super(_typeInfo);

  static const AccountType unknown = AccountType._internal('unknown', 0);

  static const AccountType admin = AccountType._internal('admin', 1);

  static const AccountType employee = AccountType._internal('employee', 2);

  static const AccountType customer = AccountType._internal('customer', 3);

  static AccountType? byIndex($core.int index) {
    try {
      return values[index];
    } catch (_) {
      return null;
    }
  }

  static AccountType? byName($core.String name) {
    return _map[name];
  }

  static const values = [unknown, admin, employee, customer];
  static const _map = <$core.String, AccountType>{
    "unknown": unknown,
    "admin": admin,
    "employee": employee,
    "customer": customer
  };

  @$core.override
  $core.int get hashCode => _index;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! AccountType) {
      return false;
    }

    return other._index == _index;
  }

  @$core.override
  $td.Uint8List encode() {
    var writer = $nex.getWriter(1);
    writer.encodeUint8(_index);
    return writer.takeBytes();
  }

  @$core.override
  $core.String toString() => _name;

  $core.String toDebugString() => "AccountType($_name: $_index)";
}

class AccountDetails extends $nex.NexemaType {
  final $nex.UnionTypeState<AccountDetails, AccountDetailsField> _state;

  @$core.override
  $nex.NexemaTypeState<AccountDetails> get $state_ => _state;
  static const _typeInfo = $nex.TypeInfo(
      name: 'AccountDetails',
      modifier: $nex.TypeModifier.union,
      packageName: 'identity',
      annotations: {},
      fields: [
        $nex.FieldInfo<AccountDetails>(
            name: 'customer',
            dartName: 'customer',
            index: 0,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.type,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<AccountDetails>(
            name: 'employee',
            dartName: 'employee',
            index: 1,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.type,
                isNullable: false,
                typeArguments: []),
            annotations: {}),
        $nex.FieldInfo<AccountDetails>(
            name: 'admin',
            dartName: 'admin',
            index: 2,
            valueType: $nex.FieldValueType(
                kind: $nex.FieldValueKind.type,
                isNullable: false,
                typeArguments: []),
            annotations: {})
      ]);

  AccountDetails._internal($core.dynamic value, AccountDetailsField field)
      : _state = $nex.UnionTypeState(value, field),
        super(_typeInfo);

  AccountDetails._empty()
      : _state = $nex.UnionTypeState(null, AccountDetailsField.notSet),
        super(_typeInfo);

  factory AccountDetails(
      {$user.CustomerAccount? customer,
      $user.EmployeeAccount? employee,
      $user.AdminAccount? admin}) {
    if (customer != null) {
      return AccountDetails._internal(customer, AccountDetailsField.customer);
    }

    if (employee != null) {
      return AccountDetails._internal(employee, AccountDetailsField.employee);
    }

    if (admin != null) {
      return AccountDetails._internal(admin, AccountDetailsField.admin);
    }

    return AccountDetails._internal(null, AccountDetailsField.notSet);
  }

  factory AccountDetails.decode($td.Uint8List buffer) {
    var instance = AccountDetails._empty();
    instance.mergeFrom(buffer);
    return instance;
  }

  factory AccountDetails.customer($user.CustomerAccount value) {
    return AccountDetails._internal(value, AccountDetailsField.customer);
  }

  factory AccountDetails.employee($user.EmployeeAccount value) {
    return AccountDetails._internal(value, AccountDetailsField.employee);
  }

  factory AccountDetails.admin($user.AdminAccount value) {
    return AccountDetails._internal(value, AccountDetailsField.admin);
  }

  AccountDetailsField get whichField => _state.currentField;
  $core.bool get hasValue => _state.currentField != AccountDetailsField.notSet;

  $user.CustomerAccount get customer =>
      _state.get<$user.CustomerAccount>(AccountDetailsField.customer);
  set customer($user.CustomerAccount value) {
    _state.setCurrentValue(value, AccountDetailsField.customer);
  }

  $user.EmployeeAccount get employee =>
      _state.get<$user.EmployeeAccount>(AccountDetailsField.employee);
  set employee($user.EmployeeAccount value) {
    _state.setCurrentValue(value, AccountDetailsField.employee);
  }

  $user.AdminAccount get admin =>
      _state.get<$user.AdminAccount>(AccountDetailsField.admin);
  set admin($user.AdminAccount value) {
    _state.setCurrentValue(value, AccountDetailsField.admin);
  }

  @$core.override
  $td.Uint8List encode() {
    final writer = $nex.getWriter();
    switch (_state.currentField) {
      case AccountDetailsField.notSet:
        writer.encodeNull();
        break;

      case AccountDetailsField.customer:
        writer.encodeVarint(0);
        writer.encodeBinary(customer.encode());
        break;

      case AccountDetailsField.employee:
        writer.encodeVarint(1);
        writer.encodeBinary(employee.encode());
        break;

      case AccountDetailsField.admin:
        writer.encodeVarint(2);
        writer.encodeBinary(admin.encode());
        break;
    }
    return writer.takeBytes();
  }

  @$core.override
  void mergeFrom($td.Uint8List buffer) {
    final reader = $nex.getReader(buffer);
    if (reader.isNextNull()) {
      clear();
    } else {
      $core.int field = reader.decodeVarint();
      switch (field) {
        case 0:
          customer = $user.CustomerAccount.decode(reader.decodeBinary());
          break;

        case 1:
          employee = $user.EmployeeAccount.decode(reader.decodeBinary());
          break;

        case 2:
          admin = $user.AdminAccount.decode(reader.decodeBinary());
          break;
      }
    }
  }

  void clear() {
    _state.setCurrentValue(null, AccountDetailsField.notSet);
  }

  @$core.override
  $core.int get hashCode => _state.hashCode;

  @$core.override
  $core.bool operator ==($core.Object other) {
    if (other is! AccountDetails) {
      return false;
    }

    return other._state == _state;
  }

  @$core.override
  $core.String toString() =>
      'AccountDetails($whichField: ${_state.currentValue})';
}

enum AccountDetailsField { notSet, customer, employee, admin }
