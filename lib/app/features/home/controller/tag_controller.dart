import 'package:get/get.dart';
import 'package:lms/app/common/data/entity/tag.dart';
import 'package:lms/app/common/data/model/book_model.dart';
import 'package:lms/app/common/data/repository/tag_repository.dart';
import 'package:lms/app/common/service/book_service.dart';

class TagController extends GetxController {
  static TagController get instance => Get.find();

  final TagRepository _tagRepository = Get.find();
  final BookService _bookService = BookService();

  final RxBool isLoading = false.obs;
  final RxList<Tag> tags = <Tag>[].obs;
  final RxMap<String, List<BookModel>> tageWiseBooks =
      <String, List<BookModel>>{}.obs;
  String error = '';

  @override
  void onInit() {
    super.onInit();
    fetchTags();
  }

  Future<void> fetchTags() async {
    isLoading(true);
    try {
      tags.value = await _tagRepository.getAll();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchTageWiseBooks({required Tag tag}) async {
    if (tageWiseBooks.containsKey(tag.id)) return; // Avoid duplicate fetch

    isLoading(true);
    try {
      final books = await _bookService.getTagWiseBooks(tagId: tag.id!);
      tageWiseBooks[tag.id!] = books;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
