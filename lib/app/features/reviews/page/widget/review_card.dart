import 'package:flutter/material.dart';
import 'package:lms/app/features/reviews/controller/reviews_controller.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final ReviewTemp review;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(review.coverUrl, height: 80, width: 60, fit: BoxFit.cover),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          review.bookTitle,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      if (review.isMine)
                        IconButton(
                          icon: Icon(Icons.edit, size: 16),
                          onPressed: () {},
                        ),
                    ],
                  ),
                  Text(
                    review.author,
                    style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                  ),
                  if (!review.isMine && review.reviewer != null)
                    Text(
                      'by ${review.reviewer}',
                      style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                    ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (i) => Icon(
                          Icons.star,
                          size: 14,
                          color:
                              i < review.rating
                                  ? Colors.amber
                                  : Colors.grey.shade300,
                        ),
                      ),
                      SizedBox(width: 6),
                      Text(
                        '${review.rating}',
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    review.review,
                    style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        review.date,
                        style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                      ),
                      review.isMine
                          ? _badge('My Review')
                          : Row(
                            children: [
                              Text(
                                '❤️ ${review.likes}',
                                style: TextStyle(fontSize: 11),
                              ),
                              SizedBox(width: 8),
                              _badge('Community', outline: true),
                            ],
                          ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(String label, {bool outline = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: outline ? Colors.transparent : Colors.grey.shade200,
        border: outline ? Border.all(color: Colors.grey.shade400) : null,
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 11, color: Colors.grey[700]),
      ),
    );
  }
}
