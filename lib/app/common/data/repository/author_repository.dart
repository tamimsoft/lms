import 'package:lms/app/common/data/entity/author.dart';
import 'package:lms/app/core/services/database/online/supabase_db.dart';

class AuthorRepository with SupabaseDb {
  Future<List<Author>> getAll() async {
    final data = await findAll<Author>(
      table: DbTable.authors,
      entity: Author(), // Provide a dummy instance
    );
    return data;
  }

  Future<Author?> getById({required String id}) async {
    return await findById<Author>(
      table: DbTable.authors,
      id: id,
      entity: Author(), // Provide a dummy instance
    );
  }

  Future<List<Author>> getAllByIds({required List<String> ids}) async {
    return await findByFilter<Author>(
      table: DbTable.authors,
      filter: Filter(column: 'id', operator: FilterType.inFilter, value: ids),
      entity: Author(), // Provide a dummy instance
    );
  }
}
