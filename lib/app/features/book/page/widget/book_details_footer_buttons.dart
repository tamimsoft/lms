import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooterButtons extends StatelessWidget {
  const FooterButtons({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => Get.toNamed('/bookD/$bookId/preview'),
              child: Text('Preview'),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => Get.toNamed('/bookD/$bookId/borrow'),
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
