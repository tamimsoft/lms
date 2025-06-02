import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/features/book_details/controller/book_details_controller.dart';

class FooterButtons extends StatelessWidget {
  const FooterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final BookDetailsController controller = Get.find();
    final String bookId = controller.bookDetails.value?.id ?? '';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              // onPressed: () => Get.toNamed('/bookD/$bookId/preview'),
              onPressed: () {},
              child: Text('Preview'),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
             // onPressed: () => Get.toNamed('/bookD/$bookId/borrow'),
              onPressed: () {},
              icon: Icon(Icons.menu_book),
              label: Text('Borrow Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
