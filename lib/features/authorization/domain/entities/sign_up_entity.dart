class SignUpEntity {
  final String? firstname;
  final String? lastname;
  final String? phone;
  final String? polPerson;
  final String? email;
  final DateTime? bDay;
  final String? username;
  final String? password;
  final String? confirmPassword;
  final String? branch;

  const SignUpEntity({
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.polPerson,
    required this.email,
    required this.bDay,
    required this.username,
    required this.password,
    required this.confirmPassword,
    required this.branch,
  });
}
