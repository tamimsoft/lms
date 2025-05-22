import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/data/model/book_model.dart';
import 'package:lms/app/common/service/book_service.dart';

class BookController extends GetxController {
  static BookController get instance => Get.find();

  final BookService _bookService = BookService();

  final RxBool isLoading = false.obs;
  final RxList<BookModel> _allBooks = <BookModel>[].obs;
  final RxList<BookModel> filteredBooks = <BookModel>[].obs;

  final RxString searchKey = ''.obs;

  // Track selected Tag. Null means "All"
  final RxnString selectedTagId = RxnString(null);

  // Track selected category. Null means "All"
  final RxnString selectedCategoryId = RxnString(null);
  final Rx<BookModel?> book = Rx(null);

  String error = '';

  Future<void> fetchBooks({
    String? tagId,
    String? categoryId,
    String? bookId,
  }) async {
    isLoading(true);
    try {
      if (tagId != null && tagId.isNotEmpty) {
        selectedTagId.value = tagId;
      }
      if (categoryId != null && categoryId.isNotEmpty) {
        selectedCategoryId.value = categoryId;
      }
      final books = await _bookService.getBooks(
        tagId: selectedTagId.value ,
        categoryId: selectedCategoryId.value,
        bookId: bookId,
      );
      _allBooks.value = books.toList();
      debugPrint('Fetched ${books.length} books');
      applyFilter();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading(false);
    }
  }

  void updateSearchKey(String value) {
    searchKey.value = value;
    applyFilter();
  }

  void applyFilter() {
    final key = searchKey.value.trim().toLowerCase();

    if (key.isEmpty) {
      filteredBooks.value = _allBooks.toList();
      return;
    }

    filteredBooks.value =
        _allBooks.where((book) => book.matchesSearch(key)).toList();
  }

  Future<void> getBookById(String id) async {
    final book = _allBooks.firstWhereOrNull((book) => book.id == id);
    if (book == null) {
      this.book.value = await _bookService.getById(id: id);
    } else {
      this.book.value = book;
    }
  }
}
