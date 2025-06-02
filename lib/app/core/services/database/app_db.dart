import 'dart:io';

// Define enums for database tables and filter types
enum DbTable {
  users('users'),
  wishlists('wishlists'),
  loans('loans'),
  //
  books('books'),
  bookCopies('book_copies'),
  bookAuthors('book_authors'),
  bookCategories('book_categories'),
  bookPublications('book_publications'),
  bookTags('book_tags'),
  //
  tags('tags'),
  categories('categories'),
  authors('authors'),
  publications('publications'),
  slides('slides'),
  //
  reservations('reservations'),
  ratings('ratings'),
  reviews('reviews');

  final String name;

  const DbTable(this.name);
}

enum DbFunction {
  getBooks('get_books');

  final String name;

  const DbFunction(this.name);
}

enum Operator {
  inFilter,
  eq,
  gt,
  gte,
  lt,
  lte,
  like,
  likeAllOf,
  likeAnyOf,
  ilike,
  ilikeAllOf,
  ilikeAnyOf,
  contains,
  overlaps,
}

abstract interface class AppDb {
  Future<List<T>> callRpc<T>({
    required String functionName,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> Function(T) toJson,
    Map<String, dynamic>? params,
  });

  Future<List<T>> findAll<T>({
    required DbTable table,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> Function(T) toJson,
    List<Filter>? filters,
    int limit,
    int offset,
    String? orderBy,
    bool paginate = true,
    bool isAscending = false,
    String? select,
  });

  Future<T?> findById<T>({
    required DbTable table,
    required String id,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> Function(T) toJson,
    String? select,
  });

  Future<void> insert({
    required DbTable table,
    required Map<String, dynamic> data,
  });

  Future<void> update({
    required DbTable table,
    required String id,
    required Map<String, dynamic> data,
  });

  Future<void> delete({required DbTable table, required String id});

  Future<String?> uploadImage({required File imageFile});
}

final class Filter {
  final String column;
  final Operator operator;
  final dynamic value;

  const Filter({
    required this.column,
    required this.operator,
    required this.value,
  });
}
