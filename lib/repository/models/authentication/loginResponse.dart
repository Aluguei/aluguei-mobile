class LoginResponse {
  final int expiresIn;
  final String accessToken;
  final int userId;
  final int id;
  final String createdAt;

  const LoginResponse({
    required this.expiresIn,
    required this.accessToken,
    required this.userId,
    required this.id,
    required this.createdAt
  });

  factory LoginResponse.fromJson(Map<dynamic, dynamic> json) {
    return LoginResponse(
        expiresIn: json['expiresIn'] as int,
        accessToken: json['accessToken'] as String,
        userId: json['userId'] as int,
        id: json['id'] as int,
        createdAt: json['createdAt'] as String
    );
  }
}