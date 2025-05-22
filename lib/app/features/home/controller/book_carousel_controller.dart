import 'package:get/get.dart';
import 'package:lms/app/common/data/model/book_model.dart';
import 'package:lms/app/common/service/book_service.dart';

class BookCarouselController extends GetxController {
  static BookCarouselController get instance => Get.find();

  final BookService _bookService = BookService();

  final RxBool isLoading = false.obs;
  final RxInt sliderIndex = 0.obs;
  final RxList<BookModel> slideList = <BookModel>[].obs;
  String error = '';

  @override
  void onInit() {
    super.onInit();
    fetchSlides();
  }

  Future<void> fetchSlides() async {
    isLoading(true);
    try {
      slideList.value = await _bookService.getAllCarouselBooks();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading(false);
    }
  }

  void updateSlideIndex(int index) {
    sliderIndex(index);
  }
}
