import 'package:get/get.dart';

class ReadingHistoryController extends GetxController {
  final booksRead = 12;
  final pagesRead = 3240;
  final readingGoal = 24;
  final currentStreak = 7;
  final totalReadingTime = 45; // in hours
  final favoriteGenre = 'Fiction';

  final recentBooks = [
    {
      'id': '1',
      'title': 'The Great Gatsby',
      'author': 'F. Scott Fitzgerald',
      'completedDate': '2024-01-15',
      'rating': 4.5,
      'coverUrl':
      'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=400',
    },
    {
      'id': '2',
      'title': 'To Kill a Mockingbird',
      'author': 'Harper Lee',
      'completedDate': '2024-01-08',
      'rating': 5.0,
      'coverUrl':
      'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&w=400',
    },
    {
      'id': '3',
      'title': '1984',
      'author': 'George Orwell',
      'completedDate': '2024-01-01',
      'rating': 4.8,
      'coverUrl':
      'https://images.unsplash.com/photo-1541963463532-d68292c34d19?auto=format&fit=crop&w=400',
    },
  ];

  double get progressPercent => booksRead / readingGoal * 100;
}
