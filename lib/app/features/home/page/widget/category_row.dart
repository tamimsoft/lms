import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/widget/shimmer_placeholder.dart';
import 'package:lms/app/features/home/controller/category_controller.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = Get.put(CategoryController());
    controller.fetchCategories();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        if (controller.isLoading.value || controller.categoryList.isEmpty) {
          return _buildPlaceholder();
        }
        return _buildContent(controller);
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

  Widget _buildContent(CategoryController controller) {
    return Row(
      spacing: 8,
      children:
          controller.categoryList
              .map((category) => Chip(label: Text(category.name!)))
              .toList(),
    );
  }
}
