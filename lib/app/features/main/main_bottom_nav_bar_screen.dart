import 'package:get/get.dart';
import 'package:lms/app/features/category/category_screen.dart';
import 'package:lms/app/features/main/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:lms/app/features/profile/profile_screen.dart';

import '../home/home_screen.dart';
import 'controllers/navigation_bar_controller.dart';
import 'widgets/navigation_bar.dart';

class MainBottomNavBarScreen extends StatelessWidget {
  MainBottomNavBarScreen({super.key});

  final List<Widget> pages = [
    const HomeScreen(),
    CategoryScreen(),
    Center(child: Text('brow')),
    Center(child: Text('Cart')),
    ProfileScreen(),
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final NavigationBarController controller = Get.put(NavigationBarController());
    return Scaffold(
      drawer: AppDrawer(),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            controller.onDestinationSelected(index);
          },
          children: pages,
        ),
      ),
      bottomNavigationBar: AppNavigationBar(pageController: _pageController),
    );
  }
}