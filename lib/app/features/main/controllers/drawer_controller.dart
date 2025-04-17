import 'package:get/get.dart';

class AppDrawerController extends GetxController {
  final RxString selectedItem = "Home".obs;

  void selectItem(String item) {
    selectedItem(item);
  }
}
