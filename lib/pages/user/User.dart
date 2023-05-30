import '../login/login.dart';
class User {
  final String id;
  final String name;
  final String username;
  final String gender;
  final String address;
  final String email;
  final String phoneNumber;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.gender,
    required this.address,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
}
