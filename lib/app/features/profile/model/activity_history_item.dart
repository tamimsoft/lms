enum ActivityType { tt, borrowing, returned, favorite, review }

class ActivityHistoryItem {
  final String id;
  final ActivityType type;
  final DateTime date;
  final String bookTitle;
  final String bookId;
  final String? details;

  ActivityHistoryItem({
    required this.id,
    required this.type,
    required this.date,
    required this.bookTitle,
    required this.bookId,
    this.details,
  });
}
