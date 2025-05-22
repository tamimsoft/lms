import '../entity/author.dart';
import '../entity/publication.dart';
import '../entity/category.dart';
import '../entity/rating.dart';
import '../entity/review.dart';
import '../entity/tag.dart';

extension BookSearchExtension on BookModel {
  bool matchesSearch(String query) {
    final lowerQuery = query.toLowerCase();

    final titleMatch = title.toLowerCase().contains(lowerQuery);

    final authorMatch = authors.any(
      (author) => author.name!.toLowerCase().contains(lowerQuery),
    );

    final publicationMatch = publications.any(
      (pub) => pub.name!.toLowerCase().contains(lowerQuery),
    );

    final tagMatch = tags.any(
      (tag) => tag.name!.toLowerCase().contains(lowerQuery),
    );

    final categoryMatch = categories.any(
      (cat) => cat.name!.toLowerCase().contains(lowerQuery),
    );

    return titleMatch ||
        authorMatch ||
        publicationMatch ||
        tagMatch ||
        categoryMatch;
  }
}

class BookModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String coverUrl;
  final String pages;
  final String publishedYear;
  final List<Author> authors;
  final List<Publication> publications;
  final List<Review> reviews;
  final List<Rating> ratings;
  final List<Tag> tags;
  final List<Category> categories;
  final bool isFavorite;

  BookModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.coverUrl,
    required this.pages,
    required this.publishedYear,
    required this.authors,
    required this.publications,
    required this.reviews,
    required this.ratings,
    required this.tags,
    required this.categories,
    required this.isFavorite,
  });
}
