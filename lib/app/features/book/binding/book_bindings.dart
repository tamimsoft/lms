import 'package:get/instance_manager.dart';
import 'package:lms/app/features/book/controller/book_controller.dart';
import 'package:lms/app/features/book/controller/category_wise_book_controller.dart';
import 'package:lms/app/features/home/controller/category_controller.dart';
import 'package:lms/app/features/home/controller/tag_controller.dart';

class BookBindings extends Bindings {
  @override
  void dependencies() {
    /// controllers
    Get.lazyPut<BookController>(() => BookController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<CategoryWiseBookController>(() => CategoryWiseBookController());
    Get.lazyPut<TagController>(() => TagController());
  }
}
