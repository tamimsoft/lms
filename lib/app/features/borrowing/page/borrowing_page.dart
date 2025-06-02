import 'package:flutter/material.dart';
import 'package:lms/app/common/widget/custom_app_bar.dart';
import 'package:lms/app/features/borrowing/controller/borrowing_controller.dart';
import 'package:lms/app/features/borrowing/page/widgets/borrowing_book_card.dart';

class BorrowingPage extends StatelessWidget {
  const BorrowingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BorrowingController controller = BorrowingController.instance;
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'My Borrowings',
          subtitle: 'Manage your borrowed books',
          bottom: TabBar(
            onTap: (index) => controller.tab(index),
            isScrollable: true,
            tabs: const [
              Tab(text: 'Active'),
              Tab(text: 'Overdue'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: [
            // Active
            _buildBorrowingList(BorrowStatus.active, controller),
            // Overdue
            _buildBorrowingList(BorrowStatus.overdue, controller),
            // Returned
            _buildBorrowingList(BorrowStatus.returned, controller),
          ],
        ),
      ),
    );
  }

  Widget _buildBorrowingList(
    BorrowStatus status,
    BorrowingController controller,
  ) {
    List<BorrowingBook> borrowings = controller.borrowingBooks(status: status);
    if (borrowings.isEmpty) {
      String? emptyMessage;
      IconData? emptyIcon;
      switch (status) {
        case BorrowStatus.active:
          emptyMessage = "You don't have any active borrowings";
          emptyIcon = Icons.menu_book_outlined;
          break;
        case BorrowStatus.overdue:
          emptyMessage = "No overdue items";
          emptyIcon = Icons.check_circle_outline;
          break;
        case BorrowStatus.returned:
          emptyMessage = "No borrowing history yet";
          emptyIcon = Icons.menu_book_outlined;
          break;
      }
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(emptyIcon, size: 40, color: Colors.grey[400]),
            SizedBox(height: 12),
            Text(emptyMessage, style: TextStyle(color: Colors.grey[600])),
            if (status == BorrowStatus.active)
              TextButton(onPressed: () {}, child: Text("Browse Books")),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: borrowings.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final book = borrowings[index];
        return BorrowingBookCard(book: book, status: status);
      },
    );
  }
}
