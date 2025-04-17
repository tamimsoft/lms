import 'package:get/get.dart';

import '../service/auth_service.dart';

class AuthController extends GetxController {
  static AuthController get instance => Get.find<AuthController>();
  final AuthService authService = Get.find<AuthService>();

  final isLoading = false.obs;
  final isAuthenticated = false.obs;

  @override
  void onInit() {
    checkAuthStatus();
    super.onInit();
  }

  void checkAuthStatus() {
    isLoading(true);
    final bool isExist = authService.isCurrentUserExist;
    isAuthenticated(isExist);
    isLoading(false);
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
