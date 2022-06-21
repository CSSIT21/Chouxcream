class User {
  final String name;
  final String email;
  final String avatarUrl;

  User({required this.name, required this.email, required this.avatarUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        name: json["name"],
        email: json["email"],
        avatarUrl: json["avatar_url"]);
  }
}
