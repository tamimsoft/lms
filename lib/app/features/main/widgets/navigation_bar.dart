import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/constants/app_strings.dart';

import '../controllers/navigation_bar_controller.dart';

class AppNavigationBar extends GetView<NavigationBarController> {
  const AppNavigationBar({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => NavigationBar(
        destinations: <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: AppString.homeText,
          ),
          NavigationDestination(
            icon: Icon(Icons.category_outlined),
            label: AppString.categoriesText,
          ),
          NavigationDestination(
            icon: Icon(Icons.business),
            label: AppString.browseText,
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: AppString.cartText,
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: AppString.profileText,
          ),
        ],
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index) {
          controller.onDestinationSelected(index);
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}