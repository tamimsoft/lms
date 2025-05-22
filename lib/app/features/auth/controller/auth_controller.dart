import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../service/auth_service.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find<AuthController>();
  final AuthService authService = Get.find<AuthService>();

  final isLoading = false.obs;
  final isAuthenticated = false.obs;

  // @override
  // void onReady() {
  //   super.onReady();
  //   Future.microtask(() => checkAuthStatus());
  // }

  void checkAuthStatus() {
    isAuthenticated(authService.isUserSignedIn);
  }

  @override
  void onInit() {
    super.onInit();
    //signOut();
    authService.initializeAuthListener(
      onChange: (session, event) {
        if (event == AuthChangeEvent.signedIn && session != null) {
          isAuthenticated(true);
        } else if (event == AuthChangeEvent.signedOut) {
          isAuthenticated(false);
        }
      },
    );
  }

  Future<void> signOut() async {
    isLoading(true);
    try {
      await authService.signOut();
      isAuthenticated(false);
    } catch (e) {
      isAuthenticated(false);
    } finally {
      isLoading(false);
    }
  }
}
