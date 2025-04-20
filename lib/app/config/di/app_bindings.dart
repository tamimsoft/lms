import 'package:get/instance_manager.dart';
import 'package:lms/app/features/auth/controllers/auth_controller.dart';
import 'package:lms/app/features/auth/controllers/login_controller.dart';
import 'package:lms/app/features/auth/controllers/signup_controller.dart';
import 'package:lms/app/features/auth/service/auth_service.dart';
import 'package:lms/app/features/profile/controllers/profile_controller.dart';
import 'package:lms/app/features/profile/widgets/edit_profile_screen.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SignupController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => EditProfileScreen());
  }
}
