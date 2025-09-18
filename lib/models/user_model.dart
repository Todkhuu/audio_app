class User {
  final String? name;
  final String? email;
  final String? phone;
  final DateTime? birthDate;
  final String identifier;
  final String password;
  final String? code;
  final String? phones;

  User({
    this.name,
    this.email,
    this.phone,
    this.birthDate,
    required this.identifier,
    required this.password,
    this.code,
    this.phones,
  });
}
