import 'package:get/get.dart';
import 'package:lms/app/common/data/model/slide.dart';
import 'package:lms/app/common/data/repository/slide_repository.dart';

class BookCarouselController extends GetxController {
  static BookCarouselController get instance => Get.find();

  final 
  SlideRepository _slideRepo = Get.find();

  final RxBool isLoading = false.obs;
  final RxInt sliderIndex = 0.obs;
  final RxList<Slide> slides = <Slide>[].obs;
  String error = '';

  @override
  void onInit() {
    super.onInit();
    fetchSlides();
  }

  Future<void> fetchSlides() async {
    isLoading(true);
    try {
      slides.value = await _slideRepo.getSlides();
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
