class SignUpEntity {
  String? firstname;
  String? lastname;
  String? phone;
  String? polPerson;
  String? email;
  DateTime? bDay;
  String? username;
  String? password;
  String? confirmPassword;
  String? branch;

  SignUpEntity({
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
