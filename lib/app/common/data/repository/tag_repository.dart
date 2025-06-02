import 'package:lms/app/core/services/database/app_db.dart';
import 'package:lms/app/common/data/model/tag.dart';

class TagRepository {
  final AppDb _db;

  TagRepository(this._db);

  Future<List<Tag>> getAll() async {
    final data = await _db.findAll<Tag>(
      table: DbTable.tags,
      fromJson: (json) => Tag.fromJson(json),
      toJson: (item) => item.toJson(),
      orderBy: 'name',
    );
    return data;
  }

  Future<List<Tag>> getAllByIds({required List<String> ids}) async {
    return await _db.findAll<Tag>(
      table: DbTable.tags,
      filters: [
        Filter(column: 'id', operator: Operator.inFilter, value: ids),
      ],
      fromJson: (json) => Tag.fromJson(json),
      toJson: (item) => item.toJson(),
    );
  }
}
