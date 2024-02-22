import 'package:equatable/equatable.dart';

class Like extends Equatable {
  final int likeId;
  final int postId;
  final int userId;
  final DateTime createdAt;

  const Like({
    required this.likeId,
    required this.postId,
    required this.userId,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [likeId, postId, userId, createdAt];

  Map<String, dynamic> toJson() {
    return {
      'likeId': likeId,
      'postId': postId,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Like.fromJson(Map<String, dynamic> json) {
    return Like(
      likeId: json['likeId'],
      postId: json['postId'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
