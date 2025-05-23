import 'dart:io';

import 'package:lms/app/common/data/entity/base_entity.dart';
import 'package:lms/app/core/services/database/app_db.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'local/hive_db_impl.dart';
import 'online/supabase_db_impl.dart';

class HybridDbImpl implements AppDb {
  final HiveDbImpl _hiveDb = HiveDbImpl();
  final SupabaseDbImpl _supabaseDb = SupabaseDbImpl();

  bool get _isOnline => Supabase.instance.client.auth.currentSession != null;

  @override
  Future<List<T>> findAll<T extends BaseEntity<T>>({
    required DbTable table,
    required T entity,
    List<Filter>? filters,
    int limit = 10,
    int offset = 0,
    String? orderBy,
    bool paginate = true,
    bool isAscending = true,
  }) async {
    try {
      // Return from cache
      final cachedData = await _hiveDb.findAll<T>(
        table: table,
        entity: entity,
        filters: filters,
        limit: limit,
        offset: offset,
        orderBy: orderBy,
        paginate: paginate,
        isAscending: isAscending,
      );

      // Fetch and sync if online
      if (_isOnline) {
        final onlineData = await _supabaseDb.findAll<T>(
          table: table,
          entity: entity,
          filters: filters,
          limit: limit,
          offset: offset,
          orderBy: orderBy,
          paginate: paginate,
          isAscending: isAscending,
        );
        for (final item in onlineData) {
          await _hiveDb.insert(table: table, data: item.toJson());
        }
        return onlineData;
      }

      return cachedData;
    } catch (e) {
      return await _hiveDb.findAll<T>(
        table: table,
        entity: entity,
        filters: filters,
        limit: limit,
        offset: offset,
        orderBy: orderBy,
        paginate: paginate,
        isAscending: isAscending,
      );
    }
  }

  @override
  Future<T?> findById<T extends BaseEntity<T>>({
    required DbTable table,
    required String id,
    required T entity,
  }) async {
    final cached = await _hiveDb.findById<T>(
      table: table,
      id: id,
      entity: entity,
    );

    if (_isOnline) {
      final online = await _supabaseDb.findById<T>(
        table: table,
        id: id,
        entity: entity,
      );
      if (online != null) {
        await _hiveDb.insert(table: table, data: online.toJson());
        return online;
      }
    }

    return cached;
  }

  @override
  Future<void> insert({
    required DbTable table,
    required Map<String, dynamic> data,
  }) async {
    await _hiveDb.insert(table: table, data: data);
    if (_isOnline) await _supabaseDb.insert(table: table, data: data);
  }

  @override
  Future<void> update({
    required DbTable table,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    await _hiveDb.update(table: table, id: id, data: data);
    if (_isOnline) await _supabaseDb.update(table: table, id: id, data: data);
  }

  @override
  Future<void> delete({required DbTable table, required String id}) async {
    await _hiveDb.delete(table: table, id: id);
    if (_isOnline) await _supabaseDb.delete(table: table, id: id);
  }

  @override
  Future<String?> uploadImage({required File imageFile}) async {
    if (_isOnline) {
      return await _supabaseDb.uploadImage(imageFile: imageFile);
    } else {
      return await _hiveDb.uploadImage(imageFile: imageFile);
    }
  }
}
