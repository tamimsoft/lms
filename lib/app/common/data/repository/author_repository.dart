import 'package:lms/app/common/data/entity/author.dart';
import 'package:lms/app/core/services/database/online/supabase_db.dart';

class AuthorRepository {
  final SupabaseDb _db;

  AuthorRepository(this._db);

  Future<List<Author>> getAll() async {
    final data = await _db.findAll<Author>(
      table: DbTable.authors,
      entity: Author(), // Provide a dummy instance
    );
    return data;
  }

  Future<Author?> getById({required String id}) async {
    return await _db.findById<Author>(
      table: DbTable.authors,
      id: id,
      entity: Author(), // Provide a dummy instance
    );
  }

  Future<List<Author>> getAllByIds({required List<String> ids}) async {
    return await _db.findAll<Author>(
      table: DbTable.authors,
      filters: [
        Filter(column: 'id', operator: FilterType.inFilter, value: ids),
      ],
      entity: Author(),
    );
  }
}
