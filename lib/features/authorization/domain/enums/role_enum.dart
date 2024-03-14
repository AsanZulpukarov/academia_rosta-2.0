enum RoleType {
  student,
  teacher;

  RoleType fromJson(String role) {
    if (role == "teacher") {
      return RoleType.teacher;
    } else {
      return RoleType.student;
    }
  }

  String toJson(RoleType roleType) {
    if (roleType == RoleType.student) {
      return "student";
    } else {
      return "teacher";
    }
  }
}
