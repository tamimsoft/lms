import 'package:get/get.dart';
import 'package:lms/app/features/book/page/book_page.dart';
import 'package:flutter/material.dart';
import 'package:lms/app/features/profile/profile_screen.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../home/page/home_page.dart';
import 'controllers/navigation_bar_controller.dart';
import 'widgets/navigation_bar.dart';

enum PageTitle {
  home('BookWorm'),
  books('Browse Books'),
  favorites('My Favorites'),
  profile('My Profile');

  final String name;

  const PageTitle(this.name);
}

class MainBottomNavBar extends StatelessWidget {
  MainBottomNavBar({super.key});

  final List<Widget> pages = [
    HomePage(),
    BookPage(),
    Center(child: Text('brow')),
    ProfileScreen(),
  ];

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final NavigationBarController controller = Get.put(
      NavigationBarController(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          final index = controller.selectedIndex.value;
          return Text(PageTitle.values.elementAt(index).name,
            style:
          TextStyle(
            color: context.theme.colorScheme.primary,
            fontWeight: FontWeight.bold
          ));
        }),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.bell),
            onPressed: () {
              // Handle search icon press
            },
          ),
        ],
      ),

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
