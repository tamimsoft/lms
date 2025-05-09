

import '../entity/author.dart';
import '../entity/publication.dart';
import '../entity/category.dart';
import '../entity/rating.dart';
import '../entity/review.dart';
import '../entity/tage.dart';

class BookModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String coverUrl;
  final List<Author> authors;
  final List<Publication> publications;
  final List<Review> reviews;
  final List<Rating> ratings;
  final List<Tage> tags;
  final List<Category> categories;
  final bool isFavorite;

  BookModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.coverUrl,
    required this.authors,
    required this.publications,
    required this.reviews,
    required this.ratings,
    required this.tags,
    required this.categories,
    required this.isFavorite,
  });
}
