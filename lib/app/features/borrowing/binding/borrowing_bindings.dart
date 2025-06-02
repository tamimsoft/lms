import 'package:get/instance_manager.dart';
import 'package:lms/app/features/borrowing/controller/borrowing_controller.dart';

class BorrowingBindings extends Bindings {
  @override
  void dependencies() {
    /// controllers
    Get.lazyPut<BorrowingController>(() => BorrowingController());
  }
}
