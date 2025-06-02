import 'package:get/instance_manager.dart';
import 'package:lms/app/common/data/repository/review_repository.dart';
import 'package:lms/app/features/book_details/controller/book_details_controller.dart';
import 'package:lms/app/features/reviews/controller/reviews_controller.dart';

class BookDetailsBindings extends Bindings {
  @override
  void dependencies() {
    /// controllers
    Get.lazyPut<BookDetailsController>(() => BookDetailsController());
    Get.lazyPut<ReviewsController>(() => ReviewsController());
    Get.lazyPut<ReviewRepository>(() => ReviewRepository(Get.find()));
  }
}
