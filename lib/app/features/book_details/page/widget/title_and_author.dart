import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/widget/shimmer_placeholder.dart';
import 'package:lms/app/features/book_details/controller/book_details_controller.dart';

import 'info_column.dart';


class TitleAndAuthor extends StatelessWidget {
  const TitleAndAuthor({super.key});

  @override
  Widget build(BuildContext context) {
    final BookDetailsController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Obx(() {
        final bookD = controller.bookDetails.value;

        if (controller.isLoading.value || bookD == null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerPlaceholder(height: 24, width: 200),
              SizedBox(height: 8),
              ShimmerPlaceholder(height: 16, width: 150),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (_) => ShimmerPlaceholder(height: 60, width: 80),
                ),
              ),
              SizedBox(height: 24),
              ShimmerPlaceholder(height: 20, width: 120),
              SizedBox(height: 8),
              ShimmerPlaceholder(height: 100),
            ],
          );
        }
        final String authors = bookD.authors.join(', ');
        final String categories = bookD.categories.join(', ');

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bookD.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(authors, style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoColumn(
                  icon: Icons.menu_book,
                  label: 'Pages',
                  value: bookD.pages.toString(),
                ),
                InfoColumn(
                  icon: Icons.calendar_today,
                  label: 'Published',
                  value: bookD.publishedYear.toString(),
                ),
                InfoColumn(
                  icon: Icons.category,
                  label: 'Category',
                  value: categories,
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'About this book',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(bookD.description, style: TextStyle(color: Colors.grey[700])),
          ],
        );
      }),
    );
  }
}
