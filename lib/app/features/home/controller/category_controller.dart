import 'package:get/get.dart';
import 'package:lms/app/common/data/model/category.dart';
import 'package:lms/app/common/data/repository/category_repository.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final CategoryRepository _catRepo = Get.find();

  final RxBool isLoading = false.obs;
  final RxList<Category> categories = <Category>[].obs;
  String error = '';

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    isLoading(true);
    try {
      categories.value = await _catRepo.getAll();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
