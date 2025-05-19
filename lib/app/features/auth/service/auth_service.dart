import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lms/app/core/constants/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  AuthService() : supabase = Supabase.instance.client;

  final SupabaseClient supabase;
  bool get isUserSignedIn => supabase.auth.currentUser != null;

  void initializeAuthListener({
    required void Function(Session? session, AuthChangeEvent event) onChange,
  }) {
    supabase.auth.onAuthStateChange.listen((AuthState state) {
      final session = state.session;
      final event = state.event;

      onChange(session, event);
    });
  }


  Future<T> _handleResponse<T>(Future<T> callback) async {
    try {
      return await callback;
    } on AuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await _handleResponse<AuthResponse>(
      supabase.auth.signInWithPassword(email: email, password: password),
    );
  }

  Future<void> signInWithGithub() async {
    await _handleResponse<void>(
      supabase.auth.signInWithOAuth(
        OAuthProvider.github,
        redirectTo: kIsWeb ? null : SupabaseConstants.redirectTo,
        authScreenLaunchMode:
            kIsWeb
                ? LaunchMode.platformDefault
                : LaunchMode.externalApplication,
      ),
    );
  }

  Future<void> nativeGoogleSignIn() async {
    final googleSignIn = GoogleSignIn(
      clientId: SupabaseConstants.iosClientId,
      serverClientId: SupabaseConstants.webClientId,
    );

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) throw 'Google sign-in aborted.';

    final googleAuth = await googleUser.authentication;

    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null || idToken == null) {
      throw 'Missing token(s) from Google authentication.';
    }

    await _handleResponse<void>(
      supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      ),
    );
  }

  Future<void> signUp({required String email, required String password}) async {
    await _handleResponse<AuthResponse>(
      supabase.auth.signUp(email: email, password: password),
    );
  }

  Future<void> signOut() async {
    await _handleResponse<void>(supabase.auth.signOut());
  }
}
