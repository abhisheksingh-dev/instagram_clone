import 'package:equatable/equatable.dart';

class Comment extends Equatable {
  final int commentId;
  final int postId;
  final int userId;
  final String commentText;
  final DateTime createdAt;

  const Comment({
    required this.commentId,
    required this.postId,
    required this.userId,
    required this.commentText,
    required this.createdAt,
  });

  @override
  List<Object?> get props =>
      [commentId, postId, userId, commentText, createdAt];

  Map<String, dynamic> toJson() {
    return {
      'commentId': commentId,
      'postId': postId,
      'userId': userId,
      'commentText': commentText,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      commentId: json['commentId'],
      postId: json['postId'],
      userId: json['userId'],
      commentText: json['commentText'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
