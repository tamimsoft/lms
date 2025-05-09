import 'dart:io';

import 'package:lms/app/common/data/entity/base_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum DbTable {
  users('user_profiles'),
  slides('slides'),
  books('books'),
  categories('categories'), // e.g: 'action',
  tags('tags'), // e.g: 'New Arrival',
  authors('authors'),
  publications('publications'),
  loans('loans'),
  ratings('ratings'),
  reviews('reviews');

  final String name;

  const DbTable(this.name);
}

enum FilterType {
  inFilter,
  eqFilter,
  gtFilter,
  gteFilter,
  ltFilter,
  lteFilter,
  likeFilter,
  notInFilter,
  notEqFilter,
  notLikeFilter,
  notILikeFilter,
  notILike,
  contains,
  overlaps
}

class Filter {
  final String column;
  final FilterType operator;
  final dynamic value;

  const Filter({
    required this.column,
    required this.operator,
    required this.value,
  });
}

abstract mixin class SupabaseDb {
  SupabaseClient supabase = Supabase.instance.client;

  Future<List<T>> findAll<T extends BaseEntity<T>>({
    required DbTable table,
    required T entity,
    int limit = 10, // default value
    int offset = 0, // default value
  }) async {
    try {
      final response = await supabase
          .from(table.name)
          .select()
          .range(offset, offset + limit - 1);

      final data = List<Map<String, dynamic>>.from(response);
      return data.map((item) => entity.fromJson(json: item)).cast<T>().toList();
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }
  Future<List<T>> findByFilter<T extends BaseEntity<T>>({
    required DbTable table,
    required T entity,
    required Filter filter,
    int limit = 10,
    int offset = 0,
  }) async {
    try {
      var query = supabase.from(table.name).select();

      switch (filter.operator) {
        case FilterType.inFilter:
          final list = List<dynamic>.from(filter.value);
          query = query.inFilter(filter.column, list);
          break;
        case FilterType.overlaps:
          final list = List<dynamic>.from(filter.value);
          query = query.overlaps(filter.column, list);
          break;
        case FilterType.contains:
          query = query.contains(filter.column, filter.value);
          break;
        case FilterType.eqFilter:
          query = query.eq(filter.column, filter.value);
          break;
        case FilterType.gtFilter:
          query = query.gt(filter.column, filter.value);
          break;
        case FilterType.gteFilter:
          query = query.gte(filter.column, filter.value);
          break;
        case FilterType.ltFilter:
          query = query.lt(filter.column, filter.value);
          break;
        case FilterType.likeFilter:
          query = query.like(filter.column, filter.value);
          break;
        default:
          query = query.lt(filter.column, filter.value);
      }

       query.range(offset, offset + limit - 1);

      final response = await query;
      final data = List<Map<String, dynamic>>.from(response);
      return data.map((item) => entity.fromJson(json: item)).cast<T>().toList();
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }

  Future<T?> findById<T extends BaseEntity<T>>({
    required DbTable table,
    required String id,
    required T entity,
  }) async {
    try {
      final response =
          await supabase.from(table.name).select().eq('id', id).single();
      return entity.fromJson(json: response);
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }

  Future<void> insert({
    required DbTable table,
    required Map<String, dynamic> data,
  }) async {
    try {
      await supabase.from(table.name).insert(data);
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }

  Future<void> update({
    required DbTable table,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      await supabase.from(table.name).update(data).eq('id', id);
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }

  Future<void> delete({required DbTable table, required String id}) async {
    try {
      await supabase.from(table.name).delete().eq('id', id);
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }

  Future<String?> uploadImage({required File imageFile}) async {
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final path = 'uploads/$fileName';
    try {
      await supabase.storage.from('images').remove(['uploads/$fileName']);
      await supabase.storage.from('images').upload(path, imageFile);
      return path;
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }
}
