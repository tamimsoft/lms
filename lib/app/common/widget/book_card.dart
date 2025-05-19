import 'package:flutter/material.dart';
import 'package:lms/app/common/data/entity/author.dart';
import 'package:lms/app/common/data/entity/rating.dart';
import 'package:lms/app/common/data/model/book_model.dart';
import 'package:lms/app/common/widget/custom_network_image.dart';

class BookCard extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;
  final BookModel bookModel;

  const BookCard({
    super.key,
    this.onTap,
    this.onFavoriteToggle,
    required this.bookModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Navigate to book details
      child: Card(
        margin: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: CustomNetworkImage(
                    imageUrl: bookModel.coverUrl,
                    height: 140, // Equivalent to h-56
                    width: 112,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onFavoriteToggle,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color:
                            bookModel.isFavorite
                                ? Colors.red
                                : Colors.white.withValues(alpha: 0.8 * 255),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.favorite,
                        size: 16,
                        color:
                            bookModel.isFavorite
                                ? Colors.white
                                : Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 112,
              child: Padding(
                padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      bookModel.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    _author(),
                    _rating(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _author() {
    List<Author> authors = bookModel.authors;
    String authorNames = authors.map((author) => author.name).join(', ');
    return Text(
      authorNames,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 12, color: Colors.grey),
    );
  }

  Widget _rating() {
    List<Rating> ratings = bookModel.ratings;
    double totalRating = ratings.fold(0, (sum, rating) => sum + rating.rating);

    return Row(
      children: [
        const Icon(Icons.star, size: 16, color: Color(0xFFEEA427)),
        const SizedBox(width: 4),
        Text(
          totalRating.toStringAsFixed(1),
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
