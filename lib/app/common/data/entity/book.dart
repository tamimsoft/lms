import 'base_entity.dart';

class Book implements BaseEntity<Book> {
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? coverUrl;
  final int? pages;
  final int? publishedYear;
  final List<String>? authorIds;
  final List<String>? publicationIds;
  final List<String>? categoryIds;
  final List<String>? tageIds;

  Book({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.coverUrl,
    this.pages,
    this.publishedYear,
    this.authorIds,
    this.publicationIds,
    this.categoryIds,
    this.tageIds,
  });

  @override
  Book fromJson({required Map<String, dynamic> json}) {
    return Book(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      coverUrl: json['cover_url'],
      pages: json['pages'],
      publishedYear: json['published_year'],
      authorIds: json['author_ids'] != null ? List<String>.from(json['author_ids']) : null,
      publicationIds: json['publication_ids'] != null ? List<String>.from(json['publication_ids']) : null,
      categoryIds: json['category_ids'] != null ? List<String>.from(json['category_ids']) : null,
      tageIds: json['tage_ids'] != null ? List<String>.from(json['tage_ids']) : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'cover_url': coverUrl,
      'pages': pages,
      'published_year': publishedYear,
      'author_ids': authorIds,
      'publication_ids': publicationIds,
      'category_ids': categoryIds,
      'tage_ids': tageIds,
    };
  }
}
