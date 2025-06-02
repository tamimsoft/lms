class Book {
  final String id;
  final String title;
  final String coverUrl;
  final num avgRating;
  final List<String> authors;

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
      authors: List<String>.from(json['authors']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'cover_url': coverUrl,
      'avg_rating': avgRating,
      'authors': authors,
    };
  }
}
