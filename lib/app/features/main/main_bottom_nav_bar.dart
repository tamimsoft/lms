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

enum PageSubTitle {
  home(''),
  books('Find your next favorite book'),
  favorites('5 books in your collection'),
  profile('');

  final String name;

  const PageSubTitle(this.name);
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
        leading: Obx(() {
          final index = controller.selectedIndex.value;
          final String title = PageTitle.values.elementAt(index).name;
          final String subtitle = PageSubTitle.values.elementAt(index).name;
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            title: Text(title),
            titleTextStyle: TextStyle(
              color: context.theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            subtitle:
                subtitle.isEmpty
                    ? null
                    : Text(
                      subtitle,
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
          );
        }),
        leadingWidth: double.maxFinite,
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
