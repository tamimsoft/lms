import 'package:flutter/material.dart';
import 'package:lms/app/common/data/model/book_details.dart';

class BookCoverAndRating extends StatelessWidget {
  const BookCoverAndRating({super.key, required this.bookD});

  final BookDetails bookD;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(bookD.coverUrl),
                fit: BoxFit.cover,
              ),
              border: Border.all(color: Colors.white, width: 4),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  SizedBox(width: 4),
                  Text(bookD.avgRating.toStringAsFixed(1)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
