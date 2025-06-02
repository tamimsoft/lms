import 'publication.dart';

class BookDetails {
  final String id;
  final String title;
  final String description;
  final String coverUrl;
  final int pages;
  final int publishedYear;
  final num avgRating;
  final List<String> authors;
  final List<String> tags;
  final List<String> categories;
  final List<Publication> publications;

  BookDetails({
    required this.id,
    required this.title,
    required this.description,
    required this.coverUrl,
    required this.pages,
    required this.publishedYear,
    required this.avgRating,
    required this.categories,
    required this.tags,
    required this.publications,
    required this.authors,
  });

  factory BookDetails.fromJson(Map<String, dynamic> json) {
    return BookDetails(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      coverUrl: json['cover_url'] ?? '',
      pages: json['pages'] ?? 0,
      publishedYear: json['published_year'] ?? 0,
      avgRating: json['avg_rating'] ?? 0.0,
      authors: List<String>.from(json['authors']),
      categories: List<String>.from(json['categories']),
      tags: List<String>.from(json['tags']),
      publications:
          (json['publications'] as List)
              .map((p) => Publication.fromJson(p))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'cover_url': coverUrl,
      'pages': pages,
      'published_year': publishedYear,
      'avg_rating': avgRating,
      'authors': authors,
      'tags': tags,
      'categories': categories,
      'publications': publications.map((p) => p.toJson()).toList(),
    };
  }
}
