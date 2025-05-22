import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/widget/shimmer_placeholder.dart';
import 'package:lms/app/features/book/controller/book_controller.dart';
import 'package:lms/app/features/home/controller/category_controller.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key});


  @override
  Widget build(BuildContext context) {
    final CategoryController controller = CategoryController.instance;
    final BookController bookController = BookController.instance;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        if (controller.isLoading.value || controller.categories.isEmpty) {
          return _buildPlaceholder();
        }

        // Sort categories by name (ascending)
        final sortedCategories = [...controller.categories];
        sortedCategories.sort(
          (a, b) => (a.name ?? '').toLowerCase().compareTo(
            (b.name ?? '').toLowerCase(),
          ),
        );

        return Row(
          spacing: 8,
          children: [
            // "All" Chip
            Obx(
              () => ChoiceChip(
                label: const Text('All'),
                selected: bookController.selectedCategoryId.value == null,
                onSelected: (selected) {
                  bookController.selectedCategoryId.value = null;
                  bookController.fetchBooks();
                },
              ),
            ),
            // Category Chips (sorted)
            ...sortedCategories.map(
              (category) => Obx(
                () => ChoiceChip(
                  label: Text(category.name ?? ''),
                  selected: bookController.selectedCategoryId.value == category.id,
                  onSelected: (selected) {
                   // bookController.selectedCategoryId.value = category.id;
                    bookController.fetchBooks(categoryId: category.id);
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildPlaceholder() {
    return Row(
      spacing: 8,
      children: List.generate(
        4,
        (index) => ShimmerPlaceholder(width: 100, height: 40),
      ),
    );
  }
}
