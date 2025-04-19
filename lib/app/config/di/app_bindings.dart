import 'package:get/instance_manager.dart';
import 'package:lms/app/features/auth/controllers/auth_controller.dart';
import 'package:lms/app/features/auth/service/auth_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
