import 'base_entity.dart';

class Rating implements BaseEntity<Rating> {
  String id;
  String userId;
  String bookId;
  int rating;
  String createdAt;

  Rating({
    this.id = '',
    this.userId = '',
    this.bookId = '',
    this.rating = 0,
    this.createdAt = '',
  });

  @override
  Rating fromJson({required Map<String, dynamic> json}) {
    return Rating(
      id: json['id'],
      userId: json['user_id'],
      bookId: json['book_id'],
      rating: json['rating'],
      createdAt: json['created_at'],
    );
  }

  @override
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
