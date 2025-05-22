import 'package:get/instance_manager.dart';
import 'package:lms/app/features/profile/controllers/profile_controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    /// Controllers
    Get.lazyPut(() => ProfileController());
  }
}
