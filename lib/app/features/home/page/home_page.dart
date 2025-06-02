import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lms/app/common/widget/custom_app_bar.dart';
import 'package:lms/app/features/main/controllers/navigation_bar_controller.dart';
import 'widget/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      appBar: CustomAppBar(title: 'BookWorm'),
      body: ListView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox.shrink(),
          GenericSearchBar(),
          const SizedBox(height: 16),
          BookCarousel(),
          const SizedBox(height: 16),
          CategoryRow(),
          const SizedBox(height: 16),
          TageWiseBookList(),
          const SizedBox(height: 16),
        ],
      ),
      // endDrawer: HomeScreenDrawer(),
    );
  }
}
