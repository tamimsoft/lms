import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/widget/book_card.dart';
import 'package:lms/app/common/widget/shimmer_placeholder.dart';
import 'package:lms/app/config/routes/routes_name.dart';
import 'package:lms/app/features/home/controller/tag_controller.dart';

import 'section_header.dart';

class TageWiseBookList extends StatelessWidget {
  TageWiseBookList({super.key});

  final TagController _tageController = TagController.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_tageController.isLoading.value || _tageController.tags.isEmpty) {
        return _shimmerPlaceholder();
      }
      return _tageWiseBookList(context);
    });
  }

  Widget _shimmerPlaceholder() {
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

  Widget _tageWiseBookList(BuildContext context) {
    return Column(
      children:
          _tageController.tags.map((tage) {
            // Fetch books for this tag if not already loaded
            final books = _tageController.tageWiseBooks[tage.id] ?? [];
            if (books.isEmpty) {
              _tageController.fetchTageWiseBooks(tage: tage);
              return const SizedBox.shrink(); // Can show shimmer placeholder here
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(tag: tage),
                SizedBox(
                  height: 212,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 2,
                    ),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books.elementAt(index);
                      return BookCard(
                        bookModel: book,
                        onTap: () {
                          Get.toNamed('${RoutesName.bookDetail}/${book.id}');
                        },
                      );
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(width: 8),
                  ),
                ),
                //const SizedBox(height: 16),
              ],
            );
          }).toList(),
    );
  }
}
