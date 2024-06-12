enum RoleType {
  student,
  teacher;

  RoleType fromJson(String role) {
    print(role);
    if (role == "ROLE_TEACHER") {
      return RoleType.teacher;
    } else {
      return RoleType.student;
    }
  }
}
