import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/widget/book_card.dart';
import 'package:lms/app/common/widget/shimmer_placeholder.dart';
import 'package:lms/app/config/routes/routes_name.dart';
import 'package:lms/app/core/constants/image_path.dart';
import 'package:lms/app/features/book/controller/book_controller.dart';

class BookGrid extends StatelessWidget {
  BookGrid({super.key});

  final BookController _controller = BookController.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.isLoading.value) {
        return _shimmerPlaceholder();
      }
      if (_controller.filteredBooks.isEmpty) {
        return Center(
          child: SizedBox(
            height: context.height / 2,
            width: context.width / 2,
            child: Image.asset(ImagePath.emptyFolderPng),
          ),
        );
      }
      return _categoryWiseBookGrid(context);
    });
  }

  Widget _shimmerPlaceholder() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.5, // Width / Height ratio (adjust as needed)
      ),
      itemCount: 9,
      itemBuilder: (BuildContext context, int index) {
        return ShimmerPlaceholder();
      },
    );
  }

  Widget _categoryWiseBookGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 items per row
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.5, // Adjust to fit book card size
      ),
      itemCount: _controller.filteredBooks.length,
      itemBuilder: (context, index) {
        final book = _controller.filteredBooks.elementAt(index);
        return BookCard(
          book: book,
          onTap: () {
            Get.toNamed('${RoutesName.bookDetail}/${book.id}');
          },
        );
      },
    );
  }
}
