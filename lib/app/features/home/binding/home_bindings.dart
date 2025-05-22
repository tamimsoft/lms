import 'package:get/instance_manager.dart';
import 'package:lms/app/features/home/controller/book_carousel_controller.dart';
import 'package:lms/app/features/home/controller/category_controller.dart';
import 'package:lms/app/features/home/controller/tag_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    /// controllers
    Get.lazyPut<BookCarouselController>(() => BookCarouselController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<TagController>(() => TagController());
  }
}
