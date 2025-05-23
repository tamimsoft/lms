import 'dart:io';

import 'package:hive/hive.dart';
import 'package:lms/app/common/data/entity/base_entity.dart';
import 'package:lms/app/core/services/database/app_db.dart';
import 'package:path_provider/path_provider.dart';

class HiveDbImpl implements AppDb {
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
    final box = await Hive.openBox<Map>(table.name);
    final allData =
        box.values
            .map((e) => entity.fromJson(json: Map<String, dynamic>.from(e)))
            .cast<T>()
            .toList();

    var filtered = _applyFilters(allData, filters);
    if (orderBy != null) {
      filtered.sort((a, b) {
        final aVal = a.toJson()[orderBy];
        final bVal = b.toJson()[orderBy];
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

  List<T> _applyFilters<T>(List<T> data, List<Filter>? filters) {
    if (filters == null) return data;
    return data.where((item) {
      final map = (item as BaseEntity).toJson();
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
  Future<T?> findById<T extends BaseEntity<T>>({
    required DbTable table,
    required String id,
    required T entity,
  }) async {
    final box = await Hive.openBox<Map>(table.name);
    final data = box.get(id);
    if (data == null) return null;
    return entity.fromJson(json: Map<String, dynamic>.from(data));
  }

  @override
  Future<void> insert({
    required DbTable table,
    required Map<String, dynamic> data,
  }) async {
    final box = await Hive.openBox<Map>(table.name);
    final id = data['id'] ?? DateTime.now().millisecondsSinceEpoch.toString();
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
