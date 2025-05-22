import 'package:get/get.dart';
import 'package:lms/app/common/data/model/book_model.dart';
import 'package:lms/app/common/service/book_service.dart';

class BookController extends GetxController {
  static BookController get instance => Get.find<BookController>();

  final BookService _bookService = BookService();

  final RxBool isLoading = false.obs;
  final Rx<BookModel?> book = Rx(null);

  String error = '';

  Future<void> getBookById(String id) async {
    isLoading(true);
    try {
      book.value = await _bookService.getById(id: id);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
