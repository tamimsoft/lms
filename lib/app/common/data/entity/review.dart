import 'base_entity.dart';

class Review implements BaseEntity<Review> {
  String id;
  String userId;
  String bookId;
  String title;
  String body;
  String createdAt;

  Review({
    this.id = '',
    this.userId = '',
    this.bookId = '',
    this.title = '',
    this.body = '',
    this.createdAt = '',
  });

  @override
  Review fromJson({required Map<String, dynamic> json}) {
    return Review(
      id: json['id'],
      userId: json['user_id'],
      bookId: json['book_id'],
      title: json['title'],
      body: json['body'],
      createdAt: json['created_at'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'book_id': bookId,
      'title': title,
      'body': body,
      'created_at': createdAt,
    };
  }
}
