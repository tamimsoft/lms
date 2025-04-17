import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/category_controller.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    controller.fetchCategories();
    return Scaffold(
      appBar: AppBar(title: const Text('Category List')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            itemCount: controller.categoryList.length,
            itemBuilder: (context, index) {
              final category = controller.categoryList[index];
              return Chip(label: Text(category.name));
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              mainAxisExtent: 40,
              childAspectRatio: 1.5,
            ),
          );
        }),
      ),
    );
  }
}
