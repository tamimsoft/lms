// Define enums for database tables and filter types

import 'dart:io';

import 'package:lms/app/common/data/entity/base_entity.dart';

abstract interface class SupabaseDb {
  Future<List<T>> findAll<T extends BaseEntity<T>>({
    required DbTable table,
    required T entity,
    List<Filter>? filters,
    int limit,
    int offset,
    String? orderBy,
    bool paginate = true,
    bool isAscending = false,
  });

  Future<T?> findById<T extends BaseEntity<T>>({
    required DbTable table,
    required String id,
    required T entity,
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

enum DbTable {
  users('user_profiles'),
  slides('slides'),
  books('books'),
  categories('categories'),
  tags('tags'),
  authors('authors'),
  publications('publications'),
  loans('loans'),
  ratings('ratings'),
  reviews('reviews');

  final String name;

  const DbTable(this.name);
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
