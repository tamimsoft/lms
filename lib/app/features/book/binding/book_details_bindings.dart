import 'package:get/instance_manager.dart';
import 'package:lms/app/features/book/controller/book_details_controller.dart';

class BookDetailsBindings extends Bindings {
  @override
  void dependencies() {
    /// controllers
    Get.lazyPut<BookDetailsController>(() => BookDetailsController());
  }
}
