import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/features/book_details/controller/book_preview_controller.dart';

class BookPreviewPage extends StatelessWidget {
  final BookPreviewController controller = Get.put(BookPreviewController());

   BookPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bookId = Get.parameters['id'] ?? '';
    controller.loadBook(bookId);

    if (controller.book.id == '') {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Book Not Found", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () => Get.offAllNamed('/'),
                child: Text("Return to Home"),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: Text(
                    controller.book.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(width: 40),
              ],
            ),
          ),

          // Content
          Expanded(
            child: Container(
              color: Colors.grey[100],
              padding: EdgeInsets.all(16),
              child: Obx(() => Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey[300]!),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                ),
                child: Text(
                  controller.previewContent[controller.currentPage.value - 1],
                  style: TextStyle(fontSize: 14, height: 1.6),
                ),
              )),
            ),
          ),

          // Footer
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: controller.currentPage.value == 1 ? null : controller.prevPage,
                  icon: Icon(Icons.arrow_left),
                  label: Text("Prev"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.grey),
                  ),
                ),
                Text(
                  'Page ${controller.currentPage.value} of ${controller.totalPages}',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
                ElevatedButton.icon(
                  onPressed: controller.currentPage.value >= controller.totalPages
                      ? null
                      : controller.nextPage,
                  icon: Text("Next"),
                  label: Icon(Icons.arrow_right),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: BorderSide(color: Colors.grey),
                  ),
                ),
              ],
            )),
          )
        ],
      ),
    );
  }
}
