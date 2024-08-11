class User {
  final String username;
  final String role;
  final String createdAt;
  final String updatedAt;

  User({
    required this.username,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return User(
      username: data['username'],
      role: data['role'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
    );
  }
}
