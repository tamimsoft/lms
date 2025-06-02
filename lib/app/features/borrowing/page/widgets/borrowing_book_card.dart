import 'package:flutter/material.dart';
import 'package:lms/app/common/widget/custom_network_image.dart';
import 'package:lms/app/features/borrowing/controller/borrowing_controller.dart';

class BorrowingBookCard extends StatelessWidget {
  const BorrowingBookCard({
    super.key,
    required this.book,
    required this.status,
  });

  final BorrowingBook book;
  final BorrowStatus status;

  String formatDate(DateTime date) {
    return "${date.month}/${date.day}/${date.year}";
  }

  int getDaysRemaining(DateTime dueDate) {
    final today = DateTime.now();
    return dueDate.difference(today).inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: status == BorrowStatus.returned ? Colors.grey[50] : null,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
              imageUrl: book.coverUrl,
              width: 48,
              height: 72,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(book.author, style: TextStyle(color: Colors.grey[600])),
                  SizedBox(height: 4),
                  if (status == BorrowStatus.overdue)
                    Text(
                      "Due date passed on ${formatDate(book.dueDate)}",
                      style: TextStyle(color: Colors.red[400], fontSize: 12),
                    )
                  else if (status == BorrowStatus.returned)
                    Text(
                      "Borrowed: ${formatDate(book.borrowDate)} | Returned: ${formatDate(book.returnedDate!)}",
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    )
                  else
                    Text(
                      "Due ${formatDate(book.dueDate)}",
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  if (status != BorrowStatus.returned)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          foregroundColor:
                              status == BorrowStatus.overdue
                                  ? Colors.red
                                  : Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          status == BorrowStatus.overdue
                              ? "Return Now"
                              : status == BorrowStatus.active
                              ? "Extend"
                              : "Borrow Again",
                        ),
                      ),
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
