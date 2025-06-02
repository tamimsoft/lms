class Wishlist {
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final String? coverUrl;
  final int? pages;
  final int? publishedYear;

  Wishlist({
    this.id,
    this.title,
    this.slug,
    this.description,
    this.coverUrl,
    this.pages,
    this.publishedYear,
  });

  Wishlist fromJson(Map<String, dynamic> json) {
    return Wishlist(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      coverUrl: json['cover_url'],
      pages: json['pages'],
      publishedYear: json['published_year'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'cover_url': coverUrl,
      'pages': pages,
      'published_year': publishedYear,
    };
  }
}
