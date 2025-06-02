import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/widget/custom_app_bar.dart';
import 'package:lms/app/features/wishlist/controller/wishlist_controller.dart';

import 'widgets/wishlist_book_card.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final WishlistController controller = WishlistController.instance;

    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'My Wishlist',
          subtitle: 'Books you want to read',
          bottom: TabBar(
            onTap: (index) => controller.tab(index),
            isScrollable: true,
            tabs: [
              Tab(text: 'All (${controller.wishlistBooks.length})'),
              Tab(text: 'Available'),
              Tab(text: 'Waiting List'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildBookList(controller),
            _buildBookList(controller, available: true),
            _buildBookList(controller, available: false),
          ],
        ),
      ),
    );
  }

  Widget _buildBookList(WishlistController controller, {bool? available}) {
    return Obx(() {
      final books = controller.filteredBooks(available);
      return books.isEmpty
          ? _buildEmptyState(controller)
          : ListView.builder(
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return WishlistBookCard(book: book);
            },
          );
    });
  }

  Widget _buildEmptyState(WishlistController controller) {
    final int tab = controller.tab.value;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 48, color: Colors.grey[300]),
            SizedBox(height: 12),
            Text(
              'No books in this category',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 4),
            Text(
              tab == 0
                  ? 'Start building your reading wishlist!'
                  : 'No $tab books found.',
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Add First Book"),
            ),
          ],
        ),
      ),
    );
  }
}
