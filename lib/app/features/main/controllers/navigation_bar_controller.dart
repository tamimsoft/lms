import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/features/book/binding/book_bindings.dart';
import 'package:lms/app/features/book/controller/book_controller.dart';
import 'package:lms/app/features/book/page/book_page.dart';
import 'package:lms/app/features/home/binding/home_bindings.dart';
import 'package:lms/app/features/home/page/home_page.dart';
import 'package:lms/app/features/profile/binding/profile_bindings.dart';
import 'package:lms/app/features/profile/controllers/profile_controller.dart';
import 'package:lms/app/features/profile/page/profile_page.dart';

enum Page { home, book, favorites, borrowing, profile }

class NavigationBarController extends GetxController {
  static NavigationBarController get instance => Get.find();

  final RxInt selectedIndex = 0.obs;

  List<PageMeta> pageMetaList = [
    PageMeta(title: 'BookWorm', subtitle: ''),
    PageMeta(title: 'Browse Books', subtitle: 'Find your next favorite book'),
    PageMeta(title: 'My Favorites', subtitle: '5 books in your collection'),
    PageMeta(title: 'My Borrowings', subtitle: 'Manage your borrowed books'),
    PageMeta(title: 'My Profile', subtitle: ''),
  ];

  final List<Widget> pages = [
    HomePage(),
    BookPage(),
    Center(child: Text('brow')),
    Center(child: Text('Borrowings')),
    ProfilePage(),
  ];

  @override
  void onInit() {
    HomeBindings().dependencies();
    super.onInit();
  }

  void onDestinationSelected(int index) {
    selectedIndex(index);
    switch (Page.values[index]) {
      case Page.book:
        if (!Get.isRegistered<BookController>()) {
          BookBindings().dependencies();
        }
        break;
      case Page.favorites:
        if (!Get.isRegistered()) {}
        break;
      case Page.borrowing:
        if (!Get.isRegistered()) {}
        break;
      case Page.profile:
        if (!Get.isRegistered<ProfileController>()) {
          ProfileBindings().dependencies();
        }
        break;
      default:
        HomeBindings().dependencies();
        break;
    }
  }

  void navigateToAnotherScreen({required Page page}) {
    selectedIndex(page.index);
  }
}

class PageMeta {
  final String title;
  final String subtitle;

  const PageMeta({required this.title, required this.subtitle});
}
