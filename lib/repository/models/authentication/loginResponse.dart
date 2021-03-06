import 'package:hive/hive.dart';

part 'loginResponse.g.dart';

@HiveType(typeId: 0)
class LoginResponse {
  @HiveField(0)
  final int? expiresIn;

  @HiveField(1)
  final String? accessToken;

  @HiveField(2)
  final int? userId;

  @HiveField(3)
  final int? id;

  @HiveField(4)
  final String? createdAt;

  const LoginResponse(
      {this.expiresIn, this.accessToken, this.userId, this.id, this.createdAt});

  factory LoginResponse.fromJson(Map<dynamic, dynamic> json) {
    return LoginResponse(
        expiresIn: json['expiresIn'] as int,
        accessToken: json['accessToken'] as String,
        userId: json['userId'] as int,
        id: json['id'] as int,
        createdAt: json['createdAt'] as String);
  }
}
