import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/features/book/controller/category_wise_book_controller.dart';
import 'package:lms/app/features/home/page/widget/category_row.dart';
import 'package:lms/app/features/home/page/widget/generic_search_bar.dart';

import '../../home/controller/category_controller.dart';
import 'widget/category_wise_book_grid.dart';

class BookPage extends GetView<CategoryController> {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _ = Get.put(CategoryController());
    final bookController = Get.put(CategoryWiseBookController());

    return Scaffold(
      body: Column(
        spacing: 16,
        children: [
          const SizedBox.shrink(),
          GenericSearchBar(),
          CategoryRow(
            onTap: (categoryId) {
              bookController.fetchBooks(categoryId: categoryId);
            },
          ),
          CategoryWiseBookGrid(
            categoryId: bookController.selectedCategoryId.value,
          ),
        ],
      ),
    );
  }
}
