import 'package:flutter/material.dart';
import 'widget/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 16,
          children: [
            const SizedBox.shrink(),
            GenericSearchBar(),
            BookCarousel(),
            CategoryRow(),
            TageWiseBookList(),
            const SizedBox(height: 32),
          ],
        ),
      ),
      // endDrawer: HomeScreenDrawer(),
    );
  }
}
