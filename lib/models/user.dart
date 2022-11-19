class User {
  final String email;
  final String name;
  final bool isAdmin;
  int? courseId;

  User({required this.email, required this.name, this.courseId,required this.isAdmin});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json["name"], email: json["email"], courseId: json["courseId"],isAdmin: json["isAdmin"]);
  }
}
