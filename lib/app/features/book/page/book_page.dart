import 'package:flutter/material.dart';
import 'package:lms/app/features/book/controller/category_wise_book_controller.dart';
import 'package:lms/app/features/home/controller/category_controller.dart';
import 'package:lms/app/features/home/page/widget/category_row.dart';
import 'package:lms/app/features/home/page/widget/generic_search_bar.dart';

import 'widget/category_wise_book_grid.dart';

class BookPage extends StatelessWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = CategoryController.instance;
    final CategoryWiseBookController bookController =
        CategoryWiseBookController.instance;

    return Scaffold(
      body: Column(
        spacing: 16,
        children: [
          const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(child: GenericSearchBar(padding: 0)),
                SizedBox(
                  width: 100,
                  child: DropdownButton(
                    value: '0',
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    underline: const SizedBox.shrink(),
                    iconSize: 24,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    focusColor: Colors.transparent,

                    elevation: 0,
                    hint: Text('Select'),

                    onChanged: (_) {},
                    items: [
                      DropdownMenuItem(value: '0', child: Text('All')),
                      DropdownMenuItem(value: '1', child: Text('New')),
                      DropdownMenuItem(value: '2', child: Text('Old')),
                    ],
                  ),
                ),
              ],
            ),
          ),

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
