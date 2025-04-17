import 'package:lms/app/core/services/database/online/supabase_db.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService with SupabaseDb {
  bool get isCurrentUserExist => supabase.auth.currentUser != null;

  Future<void> signOut() async => await supabase.auth.signOut();

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp({required String email, required String password}) async {
    await supabase.auth.signUp(email: email, password: password);
  }
}
