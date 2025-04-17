import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  static NavigationBarController get instance =>
      Get.find<NavigationBarController>();

  // Define your controller logic here
  // For example, you can manage the selected index of the navigation bar
  final RxInt selectedIndex = 0.obs;

  void onDestinationSelected(int index) {
    selectedIndex(index);
  }
}
