import 'package:get/get.dart';
import 'package:lms/app/common/data/model/book_model.dart';
import 'package:lms/app/common/service/book_service.dart';

class CategoryWiseBookController extends GetxController {
  static CategoryWiseBookController get instance =>
      Get.find<CategoryWiseBookController>();

  final BookService _bookService = BookService();

  final RxBool isLoading = false.obs;
  final RxList<BookModel> allBooks = <BookModel>[].obs;
  final RxList<BookModel> filteredBooks = <BookModel>[].obs;

  final RxString searchKey = ''.obs;
  final RxString selectedCategoryId = ''.obs;
  String error = '';

  Future<void> fetchBooks({required String? categoryId}) async {
    isLoading(true);
    try {
      if (categoryId == null || categoryId == '') {
        final books = await _bookService.getAllBooks();
        allBooks.value = books.toList();
        applyFilter();
        return;
      }
      selectedCategoryId.value = categoryId;
      final books = await _bookService.getCategoryWiseBooks(
        categoryId: categoryId,
      );
      allBooks.value = books.toList();
      applyFilter();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading(false);
    }
  }

  void applyFilter() {
    final key = searchKey.value.trim().toLowerCase();

    if (key.isEmpty) {
      filteredBooks.value = allBooks.toList();
      return;
    }

    filteredBooks.value =
        allBooks.where((book) => book.matchesSearch(key)).toList();
  }

  void updateSearchKey(String value) {
    searchKey.value = value;
    applyFilter();
  }
}
