import 'package:get/get.dart';

class WishlistBook {
  final String id;
  final String title;
  final String author;
  final String priority;
  final String addedDate;
  final String notes;
  final double rating;
  final bool available;
  final String coverUrl;

  WishlistBook({
    required this.id,
    required this.title,
    required this.author,
    required this.priority,
    required this.addedDate,
    required this.notes,
    required this.rating,
    required this.available,
    required this.coverUrl,
  });
}

class WishlistController extends GetxController {
  static WishlistController get instance => Get.find();
  final RxInt tab = 0.obs;

  final wishlistBooks =
      [
        WishlistBook(
          id: '1',
          title: 'Dune',
          author: 'Frank Herbert',
          priority: 'high',
          addedDate: '2024-01-20',
          notes: 'Recommended by book club',
          rating: 4.6,
          available: true,
          coverUrl:
              'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=400',
        ), WishlistBook(
          id: '1',
          title: 'Dune',
          author: 'Frank Herbert',
          priority: 'high',
          addedDate: '2024-01-20',
          notes: 'Recommended by book club',
          rating: 4.6,
          available: true,
          coverUrl:
              'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=400',
        ), WishlistBook(
          id: '1',
          title: 'Dune',
          author: 'Frank Herbert',
          priority: 'high',
          addedDate: '2024-01-20',
          notes: 'Recommended by book club',
          rating: 4.6,
          available: true,
          coverUrl:
              'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=400',
        ),
        WishlistBook(
          id: '2',
          title: "The Handmaid's Tale",
          author: 'Margaret Atwood',
          priority: 'medium',
          addedDate: '2024-01-15',
          notes: 'For dystopian literature project',
          rating: 4.1,
          available: false,
          coverUrl:
              'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=400',
        ),
        WishlistBook(
          id: '3',
          title: 'Sapiens',
          author: 'Yuval Noah Harari',
          priority: 'low',
          addedDate: '2024-01-10',
          notes: '',
          rating: 4.4,
          available: true,
          coverUrl:
              'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=400',
        ),
      ].obs;

  List<WishlistBook> get filteredBooksAll => wishlistBooks.toList();

  List<WishlistBook> filteredBooks(bool? isAvailable) =>
      wishlistBooks
          .where((b) => isAvailable == null || b.available == isAvailable)
          .toList();
}
