import 'package:get/instance_manager.dart';
import 'package:lms/app/features/reviews/controller/reviews_controller.dart';

class ReviewBindings extends Bindings {
  @override
  void dependencies() {
    /// controllers
    Get.lazyPut<ReviewsController>(() => ReviewsController());
  }
}
