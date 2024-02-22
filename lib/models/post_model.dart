import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final int postId;
  final int userId;
  final String imageUrl;
  final String caption;
  final DateTime createdAt;

  const Post({
    required this.postId,
    required this.userId,
    required this.imageUrl,
    required this.caption,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [postId, userId, imageUrl, caption, createdAt];

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'userId': userId,
      'imageUrl': imageUrl,
      'caption': caption,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['postId'],
      userId: json['userId'],
      imageUrl: json['imageUrl'],
      caption: json['caption'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
