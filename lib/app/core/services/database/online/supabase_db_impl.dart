import 'dart:io';

import 'package:lms/app/common/data/entity/base_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../app_db.dart';

class SupabaseDbImpl implements AppDb {
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Future<List<T>> findAll<T extends BaseEntity<T>>({
    required DbTable table,
    required T entity,
    List<Filter>? filters,
    bool paginate = true,
    int limit = 10,
    int offset = 0,
    String? orderBy,
    bool isAscending = true,
  }) async {
    try {
      var query = supabase.from(table.name).select();
      if (filters != null) {
        query = _filterQuery(filters, query);
      }
      if (orderBy != null) {
        query.order(orderBy, ascending: isAscending);
      }

      final response = await query.range(offset, offset + limit - 1);
      final data = List<Map<String, dynamic>>.from(response);
      return data.map((item) => entity.fromJson(json: item)).cast<T>().toList();
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }

  PostgrestFilterBuilder<PostgrestList> _filterQuery(
    List<Filter> filters,
    PostgrestFilterBuilder<PostgrestList> query,
  ) {
    for (var filter in filters) {
      switch (filter.operator) {
        case Operator.inFilter:
          final list = List<dynamic>.from(filter.value);
          query = query.inFilter(filter.column, list);
          break;
        case Operator.overlaps:
          query = query.overlaps(
            filter.column,
            List<dynamic>.from(filter.value),
          );
          break;
        case Operator.eq:
          query = query.eq(filter.column, filter.value);
          break;
        case Operator.gt:
          query = query.gt(filter.column, filter.value);
          break;
        case Operator.gte:
          query = query.gte(filter.column, filter.value);
          break;
        case Operator.lt:
          query = query.lt(filter.column, filter.value);
          break;
        case Operator.lte:
          query = query.lte(filter.column, filter.value);
          break;
        case Operator.like:
          query = query.like(filter.column, filter.value);
          break;
        case Operator.contains:
          query = query.contains(filter.column, filter.value);
          break;
        case Operator.ilike:
          query = query.ilike(filter.column, filter.value);
          break;
        case Operator.ilikeAllOf:
          query.ilikeAllOf(filter.column, List<String>.from(filter.value));
          break;
        case Operator.ilikeAnyOf:
          query.ilikeAnyOf(filter.column, List<String>.from(filter.value));
          break;
        case Operator.likeAllOf:
          query.likeAllOf(filter.column, List<String>.from(filter.value));
          break;
        case Operator.likeAnyOf:
          query.ilikeAnyOf(filter.column, List<String>.from(filter.value));
          break;
      }
    }
    return query;
  }

  @override
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

  @override
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

  @override
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

  @override
  Future<void> delete({required DbTable table, required String id}) async {
    try {
      await supabase.from(table.name).delete().eq('id', id);
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }

  @override
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
