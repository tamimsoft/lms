import 'package:get/get.dart';
import 'package:lms/app/common/data/entity/tage.dart';
import 'package:lms/app/common/data/model/book_model.dart';
import 'package:lms/app/common/data/repository/tag_repository.dart';
import 'package:lms/app/common/service/book_service.dart';

class TageController extends GetxController {
  static TageController get instance => Get.find<TageController>();

  final TagRepository _tagRepository = Get.find<TagRepository>();
  final BookService _bookService = BookService();

  final RxBool isLoading = false.obs;
  final RxList<Tage> tageList = <Tage>[].obs;
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
      tageList.value = await _tagRepository.getAll();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading(false);
    }
  }

  Future<void> fetchTageWiseBooks({required Tage tage}) async {
    if (tageWiseBooks.containsKey(tage.id)) return; // Avoid duplicate fetch

    isLoading(true);
    try {
      final books = await _bookService.getTagWiseBooks(tageId: tage.id!);
      tageWiseBooks[tage.id!] = books;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
