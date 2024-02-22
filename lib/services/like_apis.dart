import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class LikesAPI {
  final SupabaseClient _supabaseClient;

  LikesAPI(this._supabaseClient);

  Future<void> likePost({required int postId, required int userId}) async {
    try {
      await _supabaseClient.from('likes').insert({
        'post_id': postId,
        'user_id': userId,
      });
    } catch (e) {
      log('Like post error: ${e.toString()}');
    }
  }

  Future<void> unlikePost({required int postId, required int userId}) async {
    try {
      await _supabaseClient
          .from('likes')
          .delete()
          .eq('post_id', postId)
          .eq('user_id', userId);
    } catch (e) {
      log('Unlike post error: ${e.toString()}');
    }
  }

  Future<bool> isPostLiked({required int postId, required int userId}) async {
    try {
      final response = await _supabaseClient
          .from('likes')
          .select()
          .eq('post_id', postId)
          .eq('user_id', userId);
      return response.isNotEmpty;
    } catch (e) {
      log('Is post liked error: ${e.toString()}');
      rethrow;
    }
  }

  Future<int> countLikesForPost({required int postId}) async {
    try {
      final response = await _supabaseClient
          .from('likes')
          .select('user_id')
          .eq('post_id', postId);
      return response.length;
    } catch (e) {
      log('Count likes for post error: ${e.toString()}');
      rethrow;
    }
  }
}
