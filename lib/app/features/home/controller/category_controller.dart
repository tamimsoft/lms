import 'package:get/get.dart';
import 'package:lms/app/common/data/entity/category.dart';
import 'package:lms/app/common/data/repository/category_repository.dart';


class CategoryController extends GetxController {
  static CategoryController get instance => Get.find<CategoryController>();

  final CategoryRepository _categoryRepository = Get.find<CategoryRepository>();

  final RxBool isLoading = false.obs;
  final RxList<Category> categoryList = <Category>[].obs;
  String error = '';


  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    isLoading(true);
    try {
      categoryList.value = await _categoryRepository.getAll();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
