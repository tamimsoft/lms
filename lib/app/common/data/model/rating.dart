class Rating {
  final String id;
  final String userId;
  final String bookId;
  final int rating;
  final String createdAt;

  Rating({
    required this.id,
    required this.userId,
    required this.bookId,
    required this.rating,
    required this.createdAt,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      bookId: json['book_id'] ?? '',
      rating: json['rating'] ?? 0,
      createdAt: json['created_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'book_id': bookId,
      'rating': rating,
      'created_at': createdAt,
    };
  }
}
