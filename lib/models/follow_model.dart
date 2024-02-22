import 'package:equatable/equatable.dart';

class Follow extends Equatable {
  final int followId;
  final int followerId;
  final int followingId;
  final DateTime createdAt;

  const Follow({
    required this.followId,
    required this.followerId,
    required this.followingId,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [followId, followerId, followingId, createdAt];

  Map<String, dynamic> toJson() {
    return {
      'followId': followId,
      'followerId': followerId,
      'followingId': followingId,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Follow.fromJson(Map<String, dynamic> json) {
    return Follow(
      followId: json['followId'],
      followerId: json['followerId'],
      followingId: json['followingId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
