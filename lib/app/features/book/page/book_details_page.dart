import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/features/book/controller/book_controller.dart';
import 'package:lms/app/features/book/page/widget/book_detail_shimmer.dart';

import 'widget/book_details_cover_banner.dart';
import 'widget/book_details_footer_buttons.dart';
import 'widget/book_details_reviews_section.dart';
import 'widget/book_details_title_and_author.dart';

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
            // ReviewsSection(bookD: bookD),
            // FooterButtons(bookId: bookId),
          ],
        ),
      ),
    );
  }
}
