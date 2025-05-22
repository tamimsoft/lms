import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lms/app/features/book/controller/book_controller.dart';
import 'package:lms/app/features/book/page/book_page.dart';
import 'package:lms/app/features/home/controller/book_carousel_controller.dart';
import 'package:lms/app/features/home/page/home_page.dart';
import 'package:lms/app/features/profile/controllers/profile_controller.dart';
import 'package:lms/app/features/profile/page/profile_page.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'controllers/navigation_bar_controller.dart';
import 'widgets/navigation_bar.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final NavigationBarController controller = NavigationBarController.instance;
    return Scaffold(
      appBar: AppBar(
        leading: Obx(() {
          final index = controller.selectedIndex.value;
          final PageMeta page = controller.pageMetaList.elementAt(index);
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            title: Text(page.title),
            titleTextStyle: TextStyle(
              color: context.theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            subtitle:
                page.subtitle.isEmpty
                    ? null
                    : Text(
                      page.subtitle,
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

      // body: SafeArea(
      //   child: PageView(
      //     controller: pageController,
      //     onPageChanged: (index) {
      //       controller.onDestinationSelected(index);
      //     },
      //     children: controller.pages,
      //   ),
      // ),
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
            const Center(child: Text('Favorites')),
            const Center(child: Text('Borrowings')),
            Get.isRegistered<ProfileController>()
                ? const ProfilePage()
                : const SizedBox.shrink(),
          ],
        );
      }),
      bottomNavigationBar: AppNavigationBar(pageController: pageController),
    );
  }
}
