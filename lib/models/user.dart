class User {
  final String email;
  final String name;
  int? courseId;

  User({
    required this.email,
    required this.name,
    this.courseId
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json["name"],
      email: json["email"],
      courseId: json["courseId"]
    );
  }
}
