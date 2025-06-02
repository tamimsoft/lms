
class Review {
  final String id;
  final String bookTitle;
  final String author;
  final String coverUrl;
  final double rating;
  final String review;
  final String date;
  final bool isMine;
  final String? reviewer;
  final int? likes;

  Review({
    required this.id,
    required this.bookTitle,
    required this.author,
    required this.coverUrl,
    required this.rating,
    required this.review,
    required this.date,
    required this.isMine,
    this.reviewer,
    this.likes,
  });
}
