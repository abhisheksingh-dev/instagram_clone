import 'dart:developer';

import 'package:instagram_clone/models/post_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostAPI {
  final SupabaseClient _supabaseClient;

  PostAPI(this._supabaseClient);

  Future<Post?> getPostById({required int postId}) async {
    try {
      final response =
          await _supabaseClient.from('posts').select().eq('post_id', postId);
      if (response.isEmpty) {
        // Handle post not found
        log('Post with postId $postId not found');
        return null;
      } else {
        final post = Post.fromJson(response.first);
        return post;
      }
    } catch (e) {
      log('Get post by id error: ${e.toString()}');
    }
    return null;
  }

  Future<void> createPost(
      {required int userId,
      required String imageUrl,
      required String caption}) async {
    try {
      await _supabaseClient.from('posts').insert({
        'user_id': userId,
        'image_url': imageUrl,
        'caption': caption,
      });
    } catch (e) {
      log('Create post error: ${e.toString()}');
    }
  }

  Future<void> editPost(
      {required int postId, required String newCaption}) async {
    try {
      await _supabaseClient.from('posts').update({
        'caption': newCaption,
      }).eq('post_id', postId);
    } catch (e) {
      log('Edit post error: ${e.toString()}');
    }
  }

  Future<void> deletePost({required int postId}) async {
    try {
      await _supabaseClient.from('posts').delete().eq('post_id', postId);
    } catch (e) {
      log('Delete post error: ${e.toString()}');
    }
  }
}
