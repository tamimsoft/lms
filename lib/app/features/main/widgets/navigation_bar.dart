import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/constants/app_strings.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
            icon: Icon(LucideIcons.home),
            label: AppString.homeText,
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.bookOpen),
            label: AppString.bookText,
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.heart),
            label: AppString.favoriteText,
          ),
          NavigationDestination(
            icon: Icon(LucideIcons.user),
            label: AppString.profileText,
          ),
        ],
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: controller.selectedIndex.value,
        elevation: 2,
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
