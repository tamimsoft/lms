import 'package:get/get.dart';
import '../service/auth_service.dart';

class GoogleLoginController extends GetxController {
  static GoogleLoginController get instance =>
      Get.find<GoogleLoginController>();

  final AuthService _authService = Get.find<AuthService>();

  final RxBool isAuthenticated = false.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMsg = ''.obs;

  Future<void> loginWithGoogle() async {
    isLoading(true);
    try {
      await _authService.nativeGoogleSignIn();
      isAuthenticated(true);
    } catch (e) {
      errorMsg(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
