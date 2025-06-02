import 'package:get/get.dart';
import 'package:lms/app/features/book/binding/book_bindings.dart';
import 'package:lms/app/features/book/controller/book_controller.dart';
import 'package:lms/app/features/borrowing/binding/borrowing_bindings.dart';
import 'package:lms/app/features/borrowing/controller/borrowing_controller.dart';
import 'package:lms/app/features/home/binding/home_bindings.dart';
import 'package:lms/app/features/profile/binding/profile_bindings.dart';
import 'package:lms/app/features/profile/controllers/profile_controller.dart';
import 'package:lms/app/features/wishlist/binding/wishlist_bindings.dart';
import 'package:lms/app/features/wishlist/controller/wishlist_controller.dart';

enum BottomNav { home, book, wishlist, borrowing, profile }

class NavigationBarController extends GetxController {
  static NavigationBarController get instance => Get.find();

  final RxInt selectedIndex = 0.obs;
  final RxBool isNavBarVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
    HomeBindings().dependencies();
  }

  void onDestinationSelected(int index) {
    selectedIndex(index);
    switch (BottomNav.values[index]) {
      case BottomNav.book:
        if (!Get.isRegistered<BookController>()) {
          BookBindings().dependencies();
        }
        break;
      case BottomNav.wishlist:
        if (!Get.isRegistered<WishlistController>()) {
          WishlistBindings().dependencies();
        }
        break;
      case BottomNav.borrowing:
        if (!Get.isRegistered<BorrowingController>()) {
          BorrowingBindings().dependencies();
        }
        break;
      case BottomNav.profile:
        if (!Get.isRegistered<ProfileController>()) {
          ProfileBindings().dependencies();
        }
        break;
      default:
        HomeBindings().dependencies();
        break;
    }
  }
}
