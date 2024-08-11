class Authentication {
  final String accessToken;
  final String refreshToken;
  final String role;

  Authentication({
    required this.accessToken,
    required this.refreshToken,
    required this.role,
  });

  factory Authentication.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return Authentication(
        accessToken: data['accessToken'],
        refreshToken: data['refreshToken'],
        role: data['role']);
  }
}
