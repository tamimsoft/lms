import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/widget/custom_network_image.dart';
import 'package:lms/app/features/wishlist/controller/wishlist_controller.dart';

class WishlistBookCard extends StatelessWidget {
  const WishlistBookCard({super.key, required this.book});

  final WishlistBook book;

  Color getPriorityColor(String priority) {
    switch (priority) {
      case 'high':
        return Colors.red.shade100;
      case 'medium':
        return Colors.yellow.shade100;
      case 'low':
        return Colors.green.shade100;
      default:
        return Colors.grey.shade200;
    }
  }

  Color getPriorityText(String priority) {
    switch (priority) {
      case 'high':
        return Colors.red.shade800;
      case 'medium':
        return Colors.orange.shade800;
      case 'low':
        return Colors.green.shade800;
      default:
        return Colors.grey.shade800;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
              imageUrl: book.coverUrl,
              height: 80,
              width: 60,
              fit: BoxFit.cover,
            ),
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
                          book.title,
                          style: TextStyle(fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(Icons.favorite, color: Colors.red, size: 16),
                    ],
                  ),
                  Text(
                    book.author,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, size: 14, color: Colors.orange),
                      SizedBox(width: 4),
                      Text('${book.rating}', style: TextStyle(fontSize: 13)),
                    ],
                  ),
                  SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    children: [
                      _badge(
                        '${book.priority} priority',
                        getPriorityColor(book.priority),
                        getPriorityText(book.priority),
                      ),
                      _badge(
                        book.available ? 'Available' : 'Waiting List',
                        book.available
                            ? Colors.green.shade100
                            : Colors.orange.shade100,
                        book.available
                            ? Colors.green.shade800
                            : Colors.orange.shade800,
                        icon:
                            book.available
                                ? Icons.menu_book
                                : Icons.access_time,
                      ),
                    ],
                  ),
                  if (book.notes.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        '"${book.notes}"',
                        style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Added ${book.addedDate}',
                        style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          book.available ? Icons.menu_book : Icons.access_time,
                          size: 14,
                        ),
                        label: Text(book.available ? "Borrow" : "Join Queue"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              book.available
                                  ? Theme.of(Get.context!).primaryColor
                                  : Colors.grey[200],
                          foregroundColor:
                              book.available ? Colors.white : Colors.black,
                        ),
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

  Widget _badge(String label, Color bg, Color color, {IconData? icon}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 10, color: color),
            SizedBox(width: 2),
          ],
          Text(label, style: TextStyle(fontSize: 11, color: color)),
        ],
      ),
    );
  }
}
