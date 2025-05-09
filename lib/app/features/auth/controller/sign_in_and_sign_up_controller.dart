import 'package:get/get.dart';
import '../service/auth_service.dart';

class SignInAndSignUpController extends GetxController {
  static SignInAndSignUpController get instance => Get.find();
  final AuthService _authService = Get.find<AuthService>();

  final RxBool isLoading = false.obs;
  final RxBool isAuthenticated = false.obs;
  final RxString errorMsg = ''.obs;

  String _email = '';
  String _password = '';
  String _confirmPassword = '';

  final RxBool obscurePassword = true.obs;
  final RxBool isButtonEnabled = false.obs;

  final RxBool isSignInMode = true.obs;

  void toggleMode(int index) {
    errorMsg('');
    _confirmPassword = '';
    isSignInMode(index == 0);
    _enableButton();
  }

  void onChangeEmail(String value) {
    _email = value;
    _enableButton();
  }

  void onChangePassword(String value) {
    _password = value;
    _enableButton();
  }

  void onChangeConfirmPassword(String value) {
    _confirmPassword = value;
    _enableButton();
  }

  void _enableButton() {
    errorMsg('');
    if (isSignInMode.value) {
      isButtonEnabled.value = _email.isEmail && _password.length >= 6;
    } else {
      isButtonEnabled.value =
          _email.isEmail &&
          _password == _confirmPassword &&
          _password.length >= 6;
    }
  }

  Future<void> signInOrSignUp() async {
    errorMsg('');
    if (isSignInMode.value) {
      await _signIn();
    } else {
      await _signUp();
    }
  }

  Future<void> _signIn() async {
    isLoading(true);
    try {
      await _authService.signIn(email: _email, password: _password);
      isAuthenticated(true);
    } catch (e) {
      errorMsg(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> _signUp() async {
    isLoading(true);
    try {
      await _authService.signUp(email: _email, password: _password);
      isAuthenticated(true);
    } catch (e) {
      errorMsg(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
