import 'package:flutter/material.dart';

import 'widget/cover_banner.dart';
import 'widget/footer_buttons.dart';
import 'widget/reviews_section.dart';
import 'widget/title_and_author.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookCoverBanner(),
            TitleAndAuthor(),
            ReviewsSection(),
 FooterButtons(),
          ],
        ),
      ),
    );
  }
}
