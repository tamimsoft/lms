import 'package:get/get.dart';

class Book {
  final String id;
  final String title;
  final int pages;

  Book({
    required this.id,
    required this.title,
    required this.pages,
  });
}

class BookPreviewController extends GetxController {
  final currentPage = 1.obs;

  final previewContent = [
    "Chapter 1: The Beginning\n\nIt was a dark and stormy night. The wind howled through the trees, rattling the windows of the old library. Inside, a lone figure sat hunched over a desk, absorbed in a book that seemed to glow in the dim light.",
    "The pages whispered secrets as they turned, each word drawing the reader deeper into a world of mystery and wonder. The clock on the wall ticked steadily, marking the passage of time in a place where time seemed to stand still.",
    "Outside, the rain fell in sheets, creating a curtain of water that obscured the view of the surrounding town. Lightning flashed, briefly illuminating the silhouette of a person standing across the street, watching the library with unwavering attention.",
  ];

  late Book book;

  void loadBook(String id) {
    // Simulated API call
    final fetched = _mockGetBookById(id);
    if (fetched != null) {
      book = fetched;
    } else {
      book = Book(id: '', title: 'Not Found', pages: 0);
    }
  }

  Book? _mockGetBookById(String id) {
    final data = {
      '1': Book(id: '1', title: 'The Great Gatsby', pages: 100),
      '2': Book(id: '2', title: '1984', pages: 150),
    };
    return data[id];
  }

  void nextPage() {
    if (currentPage.value < totalPages) currentPage.value++;
  }

  void prevPage() {
    if (currentPage.value > 1) currentPage.value--;
  }

  int get totalPages => book.pages < previewContent.length ? book.pages : previewContent.length;
}
