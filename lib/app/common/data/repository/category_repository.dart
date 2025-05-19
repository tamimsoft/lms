import 'package:lms/app/core/services/database/online/supabase_db.dart';

import '../entity/category.dart';

class CategoryRepository {
  final SupabaseDb _db;

  CategoryRepository(this._db);

  Future<List<Category>> getAll() async {
    final data = await _db.findAll<Category>(
      table: DbTable.categories,
      entity: Category(), // Provide a dummy instance
    );
    return data;
  }

  Future<Category?> getById({required String id}) async {
    return await _db.findById<Category>(
      table: DbTable.categories,
      id: id,
      entity: Category(), // Provide a dummy instance
    );
  }

  Future<List<Category>> getAllByIds({required List<String> ids}) async {
    return await _db.findAll<Category>(
      table: DbTable.categories,
      filters: [
        Filter(column: 'id', operator: FilterType.inFilter, value: ids),
      ],
      entity: Category(), // Provide a dummy instance
    );
  }
}
