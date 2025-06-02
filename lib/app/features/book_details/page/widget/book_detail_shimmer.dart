import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookDetailShimmer extends StatelessWidget {
  const BookDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final baseColor = Colors.grey.shade300;
    final highlightColor = Colors.grey.shade100;

    return SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Column(
          children: [
            // Banner shimmer
            Container(height: 260, color: Colors.grey[300]),

            // Cover and rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 90,
                    color: Colors.white,
                    margin: EdgeInsets.only(right: 16),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 16,
                        width: 100,
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: 8),
                      ),
                      Container(height: 16, width: 60, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),

            // Title and description shimmer
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 200,
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 12),
                  ),
                  Container(
                    height: 16,
                    width: 150,
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 24),
                  ),

                  // Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(3, (index) {
                      return Column(
                        children: [
                          CircleAvatar(radius: 20, backgroundColor: Colors.white),
                          SizedBox(height: 8),
                          Container(height: 12, width: 40, color: Colors.white),
                          Container(
                            height: 12,
                            width: 30,
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 4),
                          ),
                        ],
                      );
                    }),
                  ),

                  SizedBox(height: 24),
                  Container(
                    height: 18,
                    width: 120,
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: 8),
                  ),
                  ...List.generate(
                    4,
                    (index) => Container(
                      height: 12,
                      width: double.infinity,
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 6),
                    ),
                  ),
                ],
              ),
            ),

            // Review section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: List.generate(2, (index) {
                  return Container(
                    height: 100,
                    margin: EdgeInsets.only(bottom: 16),
                    color: Colors.white,
                  );
                }),
              ),
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
              child: Row(
                children: [
                  Expanded(child: Container(height: 48, color: Colors.white)),
                  SizedBox(width: 16),
                  Expanded(child: Container(height: 48, color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
