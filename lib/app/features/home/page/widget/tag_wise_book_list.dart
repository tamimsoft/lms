import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/data/entity/tag.dart';
import 'package:lms/app/common/widget/book_card.dart';
import 'package:lms/app/common/widget/shimmer_placeholder.dart';
import 'package:lms/app/config/routes/routes_name.dart';
import 'package:lms/app/features/book/controller/book_controller.dart';
import 'package:lms/app/features/home/controller/tag_controller.dart';

import 'section_header.dart';

class TageWiseBookList extends StatelessWidget {
  TageWiseBookList({super.key});

  final TagController _tagController = TagController.instance;
  final BookController _bookController = BookController.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = _tagController.isLoading.value;
      final tags = _tagController.tags;

      if (isLoading || tags.isEmpty) return _buildShimmerPlaceholder();

      return Column(
        children: tags.map((tag) => _buildTagBooksRow(tag)).toList(),
      );
    });
  }

  Widget _buildShimmerPlaceholder() {
    return Column(
      children: List.generate(2, (index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerPlaceholder(
              height: 32,
              margin: EdgeInsets.symmetric(horizontal: 16),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 212,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ShimmerPlaceholder(
                    height: 144, // Equivalent to h-56
                    width: 112,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 8),
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      }),
    );
  }

  Widget _buildTagBooksRow(Tag tag) {
    // Move this outside build to avoid repeated calls. Ideally fetch once during init.
    // if (_bookController.tagWiseBooks[tag.id] == null) {
    //   _bookController.fetchBooks(tagId: tag.id);
    // }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(tag: tag),
        Obx(() {
          final books = _bookController.tagWiseBooks[tag.id!];

          return SizedBox(
            height: 212,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount:
                  (_bookController.isLoading.value || books == null)
                      ? 3
                      : books.length,
              itemBuilder: (context, index) {
                if (_bookController.isLoading.value || books == null) {
                  return ShimmerPlaceholder(
                    height: 144, // Equivalent to h-56
                    width: 112,
                  );
                }
                final book = books!.elementAt(index);
                return BookCard(
                  bookModel: book,
                  onTap: () {
                    Get.toNamed('${RoutesName.bookDetail}/${book.id}');
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 8),
            ),
          );
        }),
        //const SizedBox(height: 16),
      ],
    );
  }
}
