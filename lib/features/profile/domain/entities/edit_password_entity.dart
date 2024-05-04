class EditPasswordEntity {
  final int? id;
  final String? password;
  final String? confirmPassword;

  const EditPasswordEntity({
    required this.id,
    required this.password,
    required this.confirmPassword,
  });
}
