import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lms/app/common/widget/custom_app_bar.dart';
import 'package:lms/app/features/home/page/widget/category_row.dart';
import 'package:lms/app/features/main/controllers/navigation_bar_controller.dart';

import 'widget/book_grid.dart';
import 'widget/search_and_filter.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = NavigationBarController.instance;
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        navController.isNavBarVisible.value = false;
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        navController.isNavBarVisible.value = true;
      }
    });

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Explore Books',
        subtitle: 'Find your next favorite book',
      ),
      body: ListView(
        controller: scrollController,
        children: [
          SizedBox(width: 8),
          SearchAndFilterBar(selectedValue: '0', onChanged: (value) {}),
          const SizedBox(height: 16),
          CategoryRow(),
          const SizedBox(height: 16),
          BookGrid(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
