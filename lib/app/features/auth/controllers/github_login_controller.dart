import 'package:get/get.dart';

import '../service/auth_service.dart';

class GithubLoginController extends GetxController {
  static GithubLoginController get instance =>
      Get.find<GithubLoginController>();

  final AuthService _authService = Get.find<AuthService>();

  final RxBool isAuthenticated = false.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMsg = ''.obs;

  Future<void> loginWithGithub() async {
    isLoading(true);
    try {
      await _authService.signInWithGithub();
      isAuthenticated(true);
    } catch (e) {
      errorMsg(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
