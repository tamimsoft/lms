import 'package:get/get.dart';

import '../service/auth_service.dart';
import 'auth_state.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find<LoginController>();

  final AuthService _authService = Get.find<AuthService>();

  final Rx<AuthState> state = AuthState().obs;
  final RxBool obscurePassword = true.obs;
  final RxBool isButtonEnabled = false.obs;

  void onChangeEmail(String value) {
    state.value = state.value.copyWith(email: value, status: Status.initial);
    _enableButton();
  }

  void onChangePassword(String value) {
    state.value = state.value.copyWith(password: value, status: Status.initial);
    _enableButton();
  }

  void _enableButton() {
    isButtonEnabled.value =
        state.value.email.isEmail &&
        state.value.password.isNotEmpty &&
        state.value.password.length >= 6;
  }

  Future<void> login() async {
    state.value = state.value.copyWith(status: Status.loading);
    try {
      await _authService.signIn(
        email: state.value.email,
        password: state.value.password,
      );
      state.value = state.value.copyWith(status: Status.authenticated);
    } catch (e) {
      state.value = state.value.copyWith(
        status: Status.error,
        errorMsg: e.toString(),
      );
    }
  }
}
