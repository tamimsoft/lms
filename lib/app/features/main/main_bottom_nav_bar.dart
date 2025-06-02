import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lms/app/features/book/controller/book_controller.dart';
import 'package:lms/app/features/book/page/book_page.dart';
import 'package:lms/app/features/borrowing/controller/borrowing_controller.dart';
import 'package:lms/app/features/borrowing/page/borrowing_page.dart';
import 'package:lms/app/features/home/controller/book_carousel_controller.dart';
import 'package:lms/app/features/home/page/home_page.dart';
import 'package:lms/app/features/profile/controllers/profile_controller.dart';
import 'package:lms/app/features/profile/page/profile_page.dart';
import 'package:lms/app/features/wishlist/controller/wishlist_controller.dart';
import 'package:lms/app/features/wishlist/page/wishlist_page.dart';

import 'controllers/navigation_bar_controller.dart';
import 'widgets/navigation_bar.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationBarController controller = NavigationBarController.instance;
    return Scaffold(
      body: Obx(() {
        final index = controller.selectedIndex.value;

        return IndexedStack(
          index: index,
          children: [
            Get.isRegistered<BookCarouselController>()
                ? const HomePage()
                : const SizedBox.shrink(),
            Get.isRegistered<BookController>()
                ? const BookPage()
                : const SizedBox.shrink(),
            Get.isRegistered<WishlistController>()
                ? const WishlistPage()
                : const SizedBox.shrink(),
            Get.isRegistered<BorrowingController>()
                ? BorrowingPage()
                : const SizedBox.shrink(),
            Get.isRegistered<ProfileController>()
                ? const ProfilePage()
                : const SizedBox.shrink(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        final isVisible = controller.isNavBarVisible.value;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          height: isVisible ? kBottomNavigationBarHeight : 0,
          child: isVisible ? AppNavigationBar() : null,
        );
      }),
    );
  }
}
