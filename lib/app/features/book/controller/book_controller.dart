import 'package:get/get.dart';
import 'package:lms/app/common/data/model/book.dart';
import 'package:lms/app/common/data/repository/book_repository.dart';

class BookController extends GetxController {
  static BookController get instance => Get.find();
  final BookRepository _bookRepo = Get.find();

  Set<String> fetchedTagIds = {};

  final RxBool isLoading = false.obs;
  final RxList<Book> filteredBooks = <Book>[].obs;
  final RxMap<String, List<Book>> tagWiseBooks = <String, List<Book>>{}.obs;
  final RxString searchKey = ''.obs;

  // Track selected Tag. Null means "All"
  final RxnString selectedTagId = RxnString(null);

  // Track selected category. Null means "All"
  final RxnString selectedCategoryId = RxnString(null);

  String error = '';

  Future<void> fetchBooks({String? tagId, String? categoryId}) async {
    // if (tagWiseBooks.containsKey(tagId)) return; // Avoid duplicate fetch

    isLoading(true);
    try {
      if (tagId != null && tagId.isNotEmpty) {
        selectedTagId.value = tagId;
      }

      if (categoryId != null && categoryId.isNotEmpty) {
        selectedCategoryId.value = categoryId;
      }
      final books = await _bookRepo.getAllBookByTagIdOrCategoryId(
        tagId: selectedTagId.value,
        categoryId: selectedCategoryId.value,
      );
      if ((tagId != null && tagId.isNotEmpty) &&
          !tagWiseBooks.containsKey(tagId)) {
        tagWiseBooks[tagId] = books;
      }
      filteredBooks.value = books;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
