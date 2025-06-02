import 'package:get/instance_manager.dart';
import 'package:lms/app/features/wishlist/controller/wishlist_controller.dart';

class WishlistBindings extends Bindings {
  @override
  void dependencies() {


    /// controllers
    Get.lazyPut<WishlistController>(() => WishlistController());
  }
}
