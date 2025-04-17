import 'package:get/get.dart';
import 'package:lms/app/features/category/data/model/category_model.dart';
import 'package:lms/app/features/category/data/repository/book_repository.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find<CategoryController>();

  final CategoryRepository _categoryRepository = CategoryRepository();

  final RxBool isLoading = false.obs;
  final RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  String error = '';


  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    isLoading(true);
    try {
      categoryList.value = await _categoryRepository.getAllCategories();
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading(false);
    }
  }
}
