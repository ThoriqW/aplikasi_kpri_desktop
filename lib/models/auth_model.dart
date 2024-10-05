class Authentication {
  final String accessToken;
  final String role;

  Authentication({
    required this.accessToken,
    required this.role,
  });

  factory Authentication.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return Authentication(
      accessToken: data['accessToken'],
      role: data['role'],
    );
  }
}
