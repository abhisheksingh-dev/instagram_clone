import 'dart:developer';

import 'package:instagram_clone/models/comment_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CommentAPI {
  final SupabaseClient _supabaseClient;

  CommentAPI(this._supabaseClient);

  Future<void> addComment(
      {required int postId,
      required int userId,
      required String commentText}) async {
    try {
      await _supabaseClient.from('comments').insert({
        'post_id': postId,
        'user_id': userId,
        'comment_text': commentText,
      });
    } catch (e) {
      log('Add comment error: ${e.toString()}');
    }
  }

  Future<void> deleteComment({required int commentId}) async {
    try {
      await _supabaseClient
          .from('comments')
          .delete()
          .eq('comment_id', commentId);
    } catch (e) {
      log('Delete comment error: ${e.toString()}');
    }
  }

  Future<List<Comment>> getCommentsForPost({required int postId}) async {
    try {
      final response =
          await _supabaseClient.from('comments').select().eq('post_id', postId);
      final List<Comment> comments = [];
      for (var item in response) {
        final comment = Comment.fromJson(item);
        comments.add(comment);
      }
      return comments;
    } catch (e) {
      log('Get comments for post error: ${e.toString()}');
      return [];
    }
  }
}
