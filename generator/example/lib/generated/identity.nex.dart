import 'package:nexema/nexema.dart' as $nex;
import 'dart:typed_data' as $td;
import 'dart:core' as $core;

class AccountType extends $nex.NexemaEnumType {
  final $core.int _index;
  final $core.String _name;

  const AccountType._internal(this._name, this._index);

  static const AccountType unknown = AccountType._internal('unknown', 0);
  static const AccountType customer = AccountType._internal('customer', 1);
  static const AccountType admin = AccountType._internal('admin', 2);

  $core.int get index => _index;
  $core.String get name => _name;

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

  static const $core.List<AccountType> values = [unknown, customer, admin];
  static const _map = <$core.String, AccountType>{
    "unknown": unknown,
    "customer": customer,
    "admin": admin
  };

  @$core.override
  $td.Uint8List encode() {
    var writer = $nex.getWriter(1);
    writer.encodeUint8(_index);
    return writer.takeBytes();
  }

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
  $core.String toString() => "AccountType($_name: $_index)";
}
