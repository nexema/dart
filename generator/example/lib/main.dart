import 'package:test_files/generated/v1/common/location/address.nex.dart';
import 'package:test_files/generated/v1/common/location/coordinates.nex.dart';
import 'package:test_files/generated/v1/identity/user.nex.dart';

void main() {
  final user = User(
      id: "1234",
      createdAt: DateTime.now(),
      lastName: "Patrison",
      email: "tomas.patrison@gmail.com",
      accountType: AccountType.employee,
      accountDetails: AccountDetails.employee(
          EmployeeAccount(permissions: ["users.read", "users.write", "admin.read"])),
      address: Address(
          id: "123",
          city: "Buenos Aires",
          region: "Buenos Aires",
          country: "Argentina",
          coordinates: Coordinates(latitude: 12, longitude: 21)));

  final buffer = user.encode();

  print(User.decode(buffer));
  print(User.decode(buffer) == user);
}
