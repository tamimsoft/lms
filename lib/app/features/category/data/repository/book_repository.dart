import 'package:lms/app/core/services/database/online/supabase_db.dart';
import 'package:lms/app/features/category/data/model/category_model.dart';

class CategoryRepository with SupabaseDb {
  Future<void> deleteCategory({required String id}) async {
    await delete(table: Table.genres, id: id);
  }

  Future<List<CategoryModel>> getAllCategories() async {
    final data = await getAll<CategoryModel>(
      table: Table.genres,
      model: CategoryModel(), // Provide a dummy instance
    );
    print("category");
    print(data);
    return data;
  }

  Future<CategoryModel?> getCategoryById({required String id}) async {
    return await getById<CategoryModel>(
      table: Table.genres,
      id: id,
      model: CategoryModel(), // Provide a dummy instance
    );
  }

  Future<void> createNewCategory({required CategoryModel item}) async {
    await insert(table: Table.genres, data: item.toJson());
  }

  Future<void> updateCategory({required String id, required CategoryModel item}) async {
    await update(table: Table.genres, id: id, data: item.toJson());
  }
}
