import 'dart:io';
import 'package:get/get.dart';
import 'package:lms/app/common/service/connectivity_service.dart';
import 'package:lms/app/core/services/database/app_db.dart';
import 'local/hive_db_impl.dart';
import 'online/supabase_db_impl.dart';

class HybridDbImpl implements AppDb {
  final HiveDbImpl _hiveDb = HiveDbImpl();
  final SupabaseDbImpl _supabaseDb = SupabaseDbImpl();

  bool get _isOnline => Get.find<ConnectivityService>().isOnline;

  @override
  Future<List<T>> callRpc<T>({
    required String functionName,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> Function(T) toJson,
    Map<String, dynamic>? params,
  }) async {
    final cachedData = _hiveDb.callRpc<T>(
      functionName: functionName,
      fromJson: fromJson,
      toJson: toJson,
      params: params,
    );
    if (_isOnline) {
      try {
        final onlineData = await _supabaseDb.callRpc<T>(
          functionName: functionName,
          fromJson: fromJson,
          toJson: toJson,
          params: params,
        );
        for (final item in onlineData) {
          await _hiveDb.insert(table: DbTable.values.first, data: toJson(item));
        }
        return onlineData;
      } catch (_) {
        return cachedData;
      }
    }
    return cachedData;
  }

  @override
  Future<List<T>> findAll<T>({
    required DbTable table,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> Function(T) toJson,
    List<Filter>? filters,
    int limit = 10,
    int offset = 0,
    String? orderBy,
    bool paginate = true,
    bool isAscending = true,
    String? select,
  }) async {
    final cachedData = await _hiveDb.findAll<T>(
      table: table,
      fromJson: fromJson,
      toJson: toJson,
      filters: filters,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      paginate: paginate,
      isAscending: isAscending,
    );

    if (_isOnline) {
      try {
        final onlineData = await _supabaseDb.findAll<T>(
          table: table,
          fromJson: fromJson,
          toJson: toJson,
          filters: filters,
          limit: limit,
          offset: offset,
          orderBy: orderBy,
          paginate: paginate,
          isAscending: isAscending,
          select: select,
        );
        for (final item in onlineData) {
          await _hiveDb.insert(table: table, data: toJson(item));
        }
        return onlineData;
      } catch (_) {
        return cachedData;
      }
    }

    return cachedData;
  }

  @override
  Future<T?> findById<T>({
    required DbTable table,
    required String id,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> Function(T) toJson,
    String? select,
  }) async {
    final cached = await _hiveDb.findById<T>(
      table: table,
      id: id,
      fromJson: fromJson,
      toJson: toJson,
      select: select,
    );

    if (_isOnline) {
      try {
        final online = await _supabaseDb.findById<T>(
          table: table,
          id: id,
          fromJson: fromJson,
          toJson: toJson,
          select: select,
        );
        if (online != null) {
          await _hiveDb.insert(table: table, data: toJson(online));
          return online;
        }
      } catch (_) {}
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
