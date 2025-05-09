import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/widget/shimmer_placeholder.dart';

import '../../home/controller/category_controller.dart';

class BookPage extends GetView<CategoryController> {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    controller.fetchCategories();
    return Scaffold(
      body: Text('data')
    );
  }
}
