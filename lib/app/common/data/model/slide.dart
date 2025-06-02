import 'author.dart';

class Slide {
  final String id;
  final String title;
  final String coverUrl;
  final String shortDescription;
  final double avgRating;
  final List<Author> authors;

  Slide({
    required this.id,
    required this.title,
    required this.coverUrl,
    required this.shortDescription,
    required this.avgRating,
    required this.authors,
  });

  factory Slide.fromJson(Map<String, dynamic> json) {
    return Slide(
      id: json['id'],
      title: json['title'],
      coverUrl: json['cover_url'],
      shortDescription: json['short_description'],
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
      'short_description': shortDescription,
      'avg_rating': avgRating,
      'authors': authors.map((author) => author.toJson()).toList(),
    };
  }
}
