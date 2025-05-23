import 'package:get/instance_manager.dart';
import 'package:lms/app/common/service/book_service.dart';
import 'package:lms/app/features/book/controller/book_controller.dart';
import 'package:lms/app/features/home/controller/book_carousel_controller.dart';
import 'package:lms/app/features/home/controller/category_controller.dart';
import 'package:lms/app/features/home/controller/tag_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<BookService>(() => BookService());

    /// controllers
    Get.lazyPut<BookCarouselController>(() => BookCarouselController());
    Get.lazyPut<BookController>(() => BookController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<TagController>(() => TagController());
  }
}
