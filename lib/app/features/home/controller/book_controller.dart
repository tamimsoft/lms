// import 'package:get/get.dart';
// import 'package:lms/app/features/home/data/models/slide.dart';
// import 'package:lms/app/features/home/data/repository/category_repository.dart';
//
// import '../data/repository/slide_repository.dart';
//
// class BookController extends GetxController {
//   static BookController get instance => Get.find<BookController>();
//
//   final BookRepository _bookRepository = BookRepository();
//
//   final RxBool isLoading = false.obs;
//   final RxList<SlideModel> bookList = <SlideModel>[].obs;
//   String error = '';
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchBooks();
//   }
//
//   Future<void> fetchBooks({String? tag}) async {
//     isLoading(true);
//     try {
//       bookList.value = await _bookRepository.getAllSlide();
//       print(bookList.length);
//     } catch (e) {
//       error = e.toString();
//     } finally {
//       isLoading(false);
//     }
//   }
//
// }
