import 'package:lms/app/common/data/model/category.dart';
import 'package:lms/app/core/services/database/app_db.dart';

class CategoryRepository {
  final AppDb _db;

  CategoryRepository(this._db);

  Future<List<Category>> getAll() async {
    final data = await _db.findAll<Category>(
      table: DbTable.categories,
      fromJson: (json) => Category.fromJson(json),
      toJson: (c) => c.toJson(),
    );
    return data;
  }
}
