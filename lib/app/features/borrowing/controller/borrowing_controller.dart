import 'package:get/get.dart';

enum BorrowStatus { active, overdue, returned }

class BorrowingBook {
  final String id;
  final String bookId;
  final String title;
  final String author;
  final String coverUrl;
  final DateTime borrowDate;
  final DateTime dueDate;
  final BorrowStatus status;
  final DateTime? returnedDate;

  BorrowingBook({
    required this.id,
    required this.bookId,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.borrowDate,
    required this.dueDate,
    required this.status,
    this.returnedDate,
  });
}

class BorrowingController extends GetxController {
  static BorrowingController get instance => Get.find();
  final RxInt tab = 0.obs;

  final List<BorrowingBook> allBorrowings = [
    BorrowingBook(
      id: '1',
      bookId: '3',
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      coverUrl:
          'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=400',
      borrowDate: DateTime(2025, 5, 15),
      dueDate: DateTime(2025, 5, 22),
      status: BorrowStatus.active,
    ),
    BorrowingBook(
      id: '1',
      bookId: '3',
      title: 'The Great Gatsby',
      author: 'F. Scott Fitzgerald',
      coverUrl:
          'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=400',
      borrowDate: DateTime(2025, 5, 15),
      dueDate: DateTime(2025, 5, 22),
      status: BorrowStatus.active,
    ),
    BorrowingBook(
      id: '2',
      bookId: '7',
      title: 'To Kill a Mockingbird',
      author: 'Harper Lee',
      coverUrl:
          'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=400',
      borrowDate: DateTime(2025, 5, 10),
      dueDate: DateTime(2025, 5, 17),
      status: BorrowStatus.overdue,
    ),
    BorrowingBook(
      id: '3',
      bookId: '12',
      title: '1984',
      author: 'George Orwell',
      coverUrl:
          'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=400',
      borrowDate: DateTime(2025, 4, 20),
      dueDate: DateTime(2025, 4, 27),
      returnedDate: DateTime(2025, 4, 26),
      status: BorrowStatus.returned,
    ),
  ];

  List<BorrowingBook> borrowingBooks({required BorrowStatus status}) =>
      allBorrowings.where((b) => b.status == status).toList();
}
