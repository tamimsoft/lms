import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/widget/shimmer_placeholder.dart';
import 'package:lms/app/features/home/controller/category_controller.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key, required this.onTap});

  final Function(String?) onTap;

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.put(CategoryController());

    // Track selected category. Null means "All"
    final RxnString selectedCategoryId = RxnString(null);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        if (controller.isLoading.value || controller.categoryList.isEmpty) {
          return _buildPlaceholder();
        }

        // Sort categories by name (ascending)
        final sortedCategories = [...controller.categoryList];
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
                selected: selectedCategoryId.value == null,
                onSelected: (selected) {
                  selectedCategoryId.value = null;
                  onTap(null);
                },
              ),
            ),
            // Category Chips (sorted)
            ...sortedCategories.map(
              (category) => Obx(
                () => ChoiceChip(
                  label: Text(category.name ?? ''),
                  selected: selectedCategoryId.value == category.id,
                  onSelected: (selected) {
                    selectedCategoryId.value = category.id;
                    onTap(category.id!);
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
