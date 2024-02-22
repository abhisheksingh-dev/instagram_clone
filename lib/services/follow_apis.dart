import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class FollowAPI {
  final SupabaseClient _supabaseClient;

  FollowAPI(this._supabaseClient);

  Future<void> followUser(
      {required int followerId, required int followingId}) async {
    try {
      await _supabaseClient.from('follows').insert({
        'follower_id': followerId,
        'following_id': followingId,
      });
    } catch (e) {
      log('Follow user error: ${e.toString()}');
    }
  }

  Future<void> unfollowUser(
      {required int followerId, required int followingId}) async {
    try {
      await _supabaseClient
          .from('follows')
          .delete()
          .eq('follower_id', followerId)
          .eq('following_id', followingId);
    } catch (e) {
      log('Unfollow user error: ${e.toString()}');
    }
  }

  Future<bool> isUserFollowed(
      {required int followerId, required int followingId}) async {
    try {
      final response = await _supabaseClient
          .from('follows')
          .select()
          .eq('follower_id', followerId)
          .eq('following_id', followingId);
      return response.isNotEmpty;
    } catch (e) {
      log('Is user followed error: ${e.toString()}');
      rethrow;
    }
  }
}
