import 'package:get/get.dart';
import 'package:lms/app/common/data/model/tag.dart';
import 'package:lms/app/common/data/repository/tag_repository.dart';

class TagController extends GetxController {
  static TagController get instance => Get.find();

  final TagRepository _tagRepository = Get.find();

  final RxBool isLoading = false.obs;
  final RxList<Tag> tags = <Tag>[].obs;
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
}
