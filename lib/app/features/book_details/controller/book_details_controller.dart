import 'package:get/get.dart';
import 'package:lms/app/common/data/model/book_details.dart';
import 'package:lms/app/common/data/repository/book_repository.dart';

class BookDetailsController extends GetxController {
  static BookDetailsController get instance => Get.find();
  final BookRepository _bookRepo = Get.find();

  final RxBool isLoading = false.obs;
  final Rx<BookDetails?> bookDetails = Rx(null);

  String error = '';

  @override
  void onInit() {
    super.onInit();
    final id = Get.parameters['id'];
    if (id != null) {
      fetchBookDetailsById(id);
    }
  }

  Future<void> fetchBookDetailsById(String id) async {
    isLoading(true);
    try {
      bookDetails.value = await _bookRepo.getBookDetailsById(bId: id);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading(false);
    }
  }

  getReviewsForBook(String bookId) {}
}
