import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int userId;
  final String username;
  final String email;
  final String password;
  final String? bio;
  final String? profilePictureUrl;
  final DateTime createdAt;

  const UserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.password,
    this.bio,
    this.profilePictureUrl,
    required this.createdAt,
  });

  @override
  List<Object?> get props =>
      [userId, username, email, password, bio, profilePictureUrl, createdAt];

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'password': password,
      'bio': bio,
      'profilePictureUrl': profilePictureUrl,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      bio: json['bio'],
      profilePictureUrl: json['profilePictureUrl'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
