import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/data/model/book_model.dart';
import 'package:lms/app/common/widget/custom_network_image.dart';
import 'package:lms/app/features/book/controller/book_controller.dart';
import 'package:shimmer/shimmer.dart';

class BookDetailPage extends StatelessWidget {
  final BookController bookController = Get.find();

  BookDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String id = Get.parameters['id'] ?? '';
    bookController.getBookById(id);
    final BookModel? book = bookController.book.value;
    return Obx(() {
      if (bookController.isLoading.value || book == null) {
        return BookDetailShimmer();
      }

      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CustomNetworkImage(
                    imageUrl: book.coverUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 40,
                    left: 10,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Get.back(),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 10,
                    child: Row(
                      children: [
                        IconButton(
                          color: Colors.white,
                          icon: Icon(
                            Icons.favorite,
                            color: book.isFavorite ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(icon: Icon(Icons.share), onPressed: () {}),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Card(
                      elevation: 4.0,
                      child: Container(
                        height: 120,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.white, width: 4.0),
                        ),
                        child: CustomNetworkImage(
                          imageUrl: book.coverUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            SizedBox(width: 4),
                            Text(
                              book.ratings
                                  .fold(0, (sum, rating) => sum + rating.rating)
                                  .toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      book.authors.map((author) => author.name).join(', '),
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _InfoColumn(
                          icon: Icons.menu_book,
                          label: 'Pages',
                          value: book.pages.toString(),
                        ),
                        _InfoColumn(
                          icon: Icons.calendar_today,
                          label: 'Published',
                          value: book.publishedYear.toString(),
                        ),
                        _InfoColumn(
                          icon: Icons.category,
                          label: 'Category',
                          value: book.categories
                              .map((category) => category.name)
                              .join(', '),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'About this book',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      book.description,
                      style: TextStyle(color: Colors.black87),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              // Navigate to preview
                            },
                            child: Text('Preview'),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: FilledButton.icon(
                            onPressed: () {
                              // Navigate to borrow
                            },
                            icon: Icon(Icons.book),
                            label: Text('Borrow Now'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _InfoColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoColumn({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, color: Colors.blue),
          ),
          SizedBox(height: 4.0),
          Text(label, style: TextStyle(color: Colors.grey, fontSize: 12.0)),
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class BookDetailShimmer extends StatelessWidget {
  const BookDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  Positioned(
                    top: 40,
                    left: 10,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 10,
                    child: Row(
                      children: [
                        CircleAvatar(radius: 20, backgroundColor: Colors.white),
                        SizedBox(width: 8),
                        CircleAvatar(radius: 20, backgroundColor: Colors.white),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: Offset(0, -40),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Container(height: 120, width: 80, color: Colors.grey),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: 14, width: 60, color: Colors.grey),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 24, width: 200, color: Colors.grey),
                  SizedBox(height: 8),
                  Container(height: 16, width: 120, color: Colors.grey),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(3, (_) {
                      return Column(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey,
                          ),
                          SizedBox(height: 8),
                          Container(height: 12, width: 40, color: Colors.grey),
                          SizedBox(height: 4),
                          Container(height: 14, width: 60, color: Colors.grey),
                        ],
                      );
                    }),
                  ),
                  SizedBox(height: 16),
                  Container(height: 18, width: 150, color: Colors.grey),
                  SizedBox(height: 8),
                  Container(
                    height: 60,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Container(height: 48, color: Colors.grey),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Container(height: 48, color: Colors.grey),
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
}
