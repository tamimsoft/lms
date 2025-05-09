import 'package:lms/app/core/services/database/online/supabase_db.dart';

import '../entity/category.dart';


class CategoryRepository with SupabaseDb {
  Future<List<Category>> getAll() async {
    final data = await findAll<Category>(
      table: DbTable.categories,
      entity: Category(), // Provide a dummy instance
    );
    return data;
  }

  Future<Category?> getById({required String id}) async {
    return await findById<Category>(
      table: DbTable.categories,
      id: id,
      entity: Category(), // Provide a dummy instance
    );
  }
  Future<List<Category>> getAllByIds({required List<String> ids}) async {
    return await findByFilter<Category>(
      table: DbTable.categories,
      filter: Filter(column: 'id', operator: FilterType.inFilter, value: ids),
      entity: Category(), // Provide a dummy instance
    );
  }
}
