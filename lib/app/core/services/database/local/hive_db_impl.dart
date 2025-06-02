import 'dart:io';
import 'package:hive/hive.dart';
import 'package:lms/app/core/services/database/app_db.dart';
import 'package:path_provider/path_provider.dart';

class HiveDbImpl implements AppDb {
  @override
  Future<List<T>> callRpc<T>({
    required String functionName,
    required T Function(Map<String, dynamic> p1) fromJson,
    required Map<String, dynamic> Function(T p1) toJson,
    Map<String, dynamic>? params,
  }) async {
    final box = await Hive.openBox<Map>(functionName);
    final allData =
        box.values
            .map((e) => fromJson(Map<String, dynamic>.from(e)))
            .cast<T>()
            .toList();

    return allData;
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
    final box = await Hive.openBox<Map>(table.name);
    final allData =
        box.values
            .map((e) => fromJson(Map<String, dynamic>.from(e)))
            .cast<T>()
            .toList();

    var filtered = _applyFilters(allData, filters, toJson);

    if (orderBy != null) {
      filtered.sort((a, b) {
        final aVal = toJson(a)[orderBy] ?? '';
        final bVal = toJson(b)[orderBy] ?? '';
        return isAscending
            ? Comparable.compare(aVal, bVal)
            : Comparable.compare(bVal, aVal);
      });
    }

    if (paginate) {
      final end = (offset + limit).clamp(0, filtered.length);
      return filtered.sublist(offset, end);
    }

    return filtered;
  }

  List<T> _applyFilters<T>(
    List<T> data,
    List<Filter>? filters,
    Map<String, dynamic> Function(T) toJson,
  ) {
    if (filters == null) return data;
    return data.where((item) {
      final map = toJson(item);
      return filters.every((filter) {
        final value = map[filter.column];
        switch (filter.operator) {
          case Operator.eq:
            return value == filter.value;
          case Operator.gt:
            return value > filter.value;
          case Operator.gte:
            return value >= filter.value;
          case Operator.lt:
            return value < filter.value;
          case Operator.lte:
            return value <= filter.value;
          case Operator.contains:
            return (value as List).contains(filter.value);
          case Operator.inFilter:
            return (filter.value as List).contains(value);
          default:
            return true;
        }
      });
    }).toList();
  }

  @override
  Future<T?> findById<T>({
    required DbTable table,
    required String id,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> Function(T) toJson,
    String? select,
  }) async {
    final box = await Hive.openBox<Map>(table.name);
    final data = box.get(id);
    return data != null ? fromJson(Map<String, dynamic>.from(data)) : null;
  }

  @override
  Future<void> insert({
    required DbTable table,
    required Map<String, dynamic> data,
  }) async {
    final box = await Hive.openBox<Map>(table.name);
    final id = data['id'];
    if (id == null) throw Exception('Missing ID for Hive insert');
    await box.put(id, data);
  }

  @override
  Future<void> update({
    required DbTable table,
    required String id,
    required Map<String, dynamic> data,
  }) async {
    final box = await Hive.openBox<Map>(table.name);
    await box.put(id, data);
  }

  @override
  Future<void> delete({required DbTable table, required String id}) async {
    final box = await Hive.openBox<Map>(table.name);
    await box.delete(id);
  }

  @override
  Future<String?> uploadImage({required File imageFile}) async {
    final dir = await getApplicationDocumentsDirectory();
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final path = '${dir.path}/$fileName.png';
    final newImage = await imageFile.copy(path);
    return newImage.path;
  }
}
