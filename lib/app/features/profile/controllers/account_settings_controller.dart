import 'package:get/get.dart';

class AccountSettingsController extends GetxController {
  var firstName = 'John'.obs;
  var lastName = 'Doe'.obs;
  var email = 'john.doe@example.com'.obs;
  var phone = '+1 (555) 123-4567'.obs;
  var password = '••••••••'.obs;
  var showPassword = false.obs;

  var notifyDueDate = true.obs;
  var notifyNewBooks = false.obs;
  var notifyEvents = true.obs;

  void submit() {
    Get.snackbar(
      'Profile Updated',
      'Your profile has been successfully updated.',
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.offNamed('/profile');
  }
}
