import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class AuthAPI {
  final SupabaseClient _supabaseClient;

  AuthAPI(this._supabaseClient);

  Future<User?> login(String email, String password) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      // TODO: create a local api which will create a log with each login and store all the kpi in local database
      return response.user;
    } catch (e) {
      log('Error logging in: $e');
      return null;
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
      );
      return response.user;
    } catch (e) {
      log('Error signing up: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _supabaseClient.auth.signOut();
      log('User signed out');
    } catch (e) {
      log('Error signing out: $e');
    }
  }
}
