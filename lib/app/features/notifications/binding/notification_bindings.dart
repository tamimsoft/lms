import 'package:get/instance_manager.dart';
import 'package:lms/app/features/notifications/controller/notification_controller.dart';

class NotificationBindings extends Bindings {
  @override
  void dependencies() {
    /// controllers
    Get.lazyPut<NotificationController>(() => NotificationController());
  }
}
