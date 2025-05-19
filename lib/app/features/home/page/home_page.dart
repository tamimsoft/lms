import 'package:flutter/material.dart';
import 'widget/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      // appBar: MyAppBar(scaffoldKey: scaffoldKey),

      key: scaffoldKey,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          spacing: 16,
          children: [
            const SizedBox.shrink(),
            GenericSearchBar(),
            BookCarousel(),
            CategoryRow( onTap: (categoryId) {
              //bookController.fetchBooks(categoryId: categoryId);
            },),
            TageWiseBookList(),
            const SizedBox(height: 32),
          ],
        ),
      ),
      // endDrawer: HomeScreenDrawer(),
    );
  }
}
