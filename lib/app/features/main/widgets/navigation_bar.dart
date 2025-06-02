import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/constants/app_strings.dart';
import 'package:lms/app/features/main/controllers/navigation_bar_controller.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationBarController controller = NavigationBarController.instance;
    return Obx(
      () => NavigationBar(
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: AppString.homeText,
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            label: AppString.bookText,
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            label: AppString.wishlistText,
          ),
          NavigationDestination(
            icon: Icon(Icons.clear_all_outlined),
            label: AppString.libraryText,
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: AppString.profileText,
          ),
        ],
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: controller.selectedIndex.value,
        elevation: 2,
        onDestinationSelected: (index) {
          controller.onDestinationSelected(index);
        },
      ),
    );
  }
}
