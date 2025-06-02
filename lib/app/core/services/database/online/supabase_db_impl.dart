import 'dart:io';

import 'package:lms/app/core/services/database/app_db.dart';
import 'package:lms/app/core/services/logger/app_logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDbImpl implements AppDb {
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Future<List<T>> callRpc<T>({
    required String functionName,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> Function(T) toJson,
    Map<String, dynamic>? params,
  }) async {
    AppLogger.log('call RPC $functionName with params $params');
    try {
      final response = await supabase.rpc(functionName, params: params);
      AppLogger.log('RPC RESPONSE: $response');

      if (response == null) {
        AppLogger.log('RPC returned null data', level: LogLevel.warning);
        return [];
      }
      if (response is List) {
        final data = List<Map<String, dynamic>>.from(response);
        return data.map((item) => fromJson(item)).cast<T>().toList();
      } else {
        throw Exception('Unexpected RPC response format: $response');
      }
    } catch (e) {
      AppLogger.log(
        'Supabase RPC call failed:: ${e.toString()}',
        level: LogLevel.error,
      );
      throw Exception('Supabase RPC call failed: $e');
    }
  }

  @override
  Future<List<T>> findAll<T>({
    required DbTable table,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> Function(T) toJson,
    List<Filter>? filters,
    bool paginate = true,
    int limit = 10,
    int offset = 0,
    String? orderBy,
    bool isAscending = true,
    String? select,
  }) async {
    try {
      final String selectString = select != null ? '*, $select' : '*';
      var query = supabase.from(table.name).select(selectString);
      if (filters != null) {
        query = _filterQuery(filters, query);
      }
      if (orderBy != null) {
        query.order(orderBy, ascending: isAscending);
      }

      final response = await query.range(offset, offset + limit - 1);
      final data = List<Map<String, dynamic>>.from(response);
      return data.map((item) => fromJson(item)).cast<T>().toList();
    } catch (e) {
      throw Exception('Supabase error: $e');
    }
  }

  @override
  Future<T?> findById<T>({
    required DbTable table,
    required String id,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> Function(T) toJson,
    String? select,
  }) async {
    try {
      final String selectString = select != null ? '*, $select' : '*';
      final response =
          await supabase
              .from(table.name)
              .select(selectString)
              .eq('id', id)
              .single();
      return fromJson(response);
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
}
