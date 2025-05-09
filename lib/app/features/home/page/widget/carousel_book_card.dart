import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/data/entity/author.dart';
import 'package:lms/app/common/data/entity/rating.dart';
import 'package:lms/app/common/data/model/book_model.dart';
import 'package:lms/app/common/widget/custom_network_image.dart';

class CarouselBookCard extends StatelessWidget {
  const CarouselBookCard({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.inversePrimary.withAlpha(128),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          _coverImage(),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _title(),
                _author(),
                _rating(),
                const SizedBox(height: 4),
                _description(),
                const SizedBox(height: 8),
                _borrowButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _coverImage() {
    return FittedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CustomNetworkImage(imageUrl: book.coverUrl),
      ),
    );
  }

  Widget _title() {
    return Expanded(
      child: Text(
        book.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _author() {
    List<Author> authors = book.authors;
    String authorNames = authors.map((author) => author.name).join(', ');
    return Expanded(
      child: Text(
        authorNames,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 13),
      ),
    );
  }

  Widget _rating() {
    List<Rating> ratings = book.ratings;
    double totalRating = ratings.fold(0, (sum, rating) => sum + rating.rating);

    return Row(
      children: [
        const Icon(Icons.star, size: 16, color: Colors.amber),
        const SizedBox(width: 4),
        Text(totalRating.toStringAsFixed(1)),
      ],
    );
  }

  Widget _description() {
    return Expanded(
      child: Text(
        book.description,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  Widget _borrowButton() {
    return SizedBox(
      width: 150,
      child: FilledButton.icon(
        onPressed: () {
          // Navigate to book details
        },
        icon: const Icon(Icons.menu_book, size: 16),
        label: const Text("Read Now"),
      ),
    );
  }
}
