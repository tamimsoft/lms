import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BookFormController extends GetxController {
  final isEditMode = false.obs;
  final loading = false.obs;
  final coverPreview = ''.obs;
  File? coverImage;

  final title = ''.obs;
  final author = ''.obs;
  final category = ''.obs;
  final pages = ''.obs;
  final publishedYear = ''.obs;
  final description = ''.obs;

  final categories = ['All', 'Fiction', 'Non-fiction', 'History', 'Science', 'Fantasy'];

  void loadBook(String? id) {
    isEditMode.value = id != null;

    if (id != null) {
      // Mock existing book
      title.value = 'Mock Title';
      author.value = 'Author';
      category.value = 'Fiction';
      pages.value = '200';
      publishedYear.value = '2022';
      description.value = 'This is a mock description.';
      coverPreview.value = 'https://via.placeholder.com/150x200';
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      coverImage = File(picked.path);
      coverPreview.value = picked.path;
    }
  }

  void clearImage() {
    coverImage = null;
    coverPreview.value = '';
  }

  void submitForm() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 2));
    loading.value = false;
    Get.snackbar(
      isEditMode.value ? "Book Updated" : "Book Added",
      '"${title.value}" has been ${isEditMode.value ? 'updated' : 'added'} successfully.',
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.offAllNamed('/books');
  }
}
