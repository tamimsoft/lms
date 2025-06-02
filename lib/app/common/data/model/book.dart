import 'author.dart';

class Book {
  final String id;
  final String title;
  final String coverUrl;
  final num avgRating;
  final List<Author> authors;

  Book({
    required this.id,
    required this.title,
    required this.coverUrl,
    required this.avgRating,
    required this.authors,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      coverUrl: json['cover_url'],
      avgRating: json['avg_rating'],
      authors:
          json['authors']
              .map<Author>((author) => Author.fromJson(author))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'cover_url': coverUrl,
      'avg_rating': avgRating,
      'authors': authors.map((author) => author.toJson()).toList(),
    };
  }
}
