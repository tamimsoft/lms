class Review {
  final String id;
  final String userId;
  final String userName;
  final String bookId;
  final String bookTitle;
  final List<String> authors;
  final String coverUrl;
  final String title;
  final String body;
  final num rating;
  final bool isMine;
  final DateTime updatedAt;

  Review({
    required this.id,
    required this.userId,
    required this.userName,
    required this.bookId,
    required this.bookTitle,
    required this.authors,
    required this.coverUrl,
    required this.title,
    required this.body,
    required this.rating,
    required this.isMine,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      userName: json['user_name'] ?? '',
      bookId: json['book_id'] ?? '',
      bookTitle: json['book_title'] ?? '',
      authors: List<String>.from(json['authors'] ?? []),
      coverUrl: json['cover_url'] ?? '',
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      rating: json['rating'] ?? 0,
      isMine: json['is_mine'] ?? false,
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'user_name': userName,
      'book_id': bookId,
      'book_title': bookTitle,
      'authors': authors,
      'cover_url': coverUrl,
      'title': title,
      'body': body,
      'rating': rating,
      'is_mine': isMine,
      'updated_at': updatedAt,
    };
  }
}
