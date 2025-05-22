import 'package:lms/app/core/services/database/online/supabase_db.dart';
import 'package:lms/app/common/data/entity/tag.dart';

class TagRepository {
  final SupabaseDb _db;

  TagRepository(this._db);

  Future<List<Tag>> getAll() async {
    final data = await _db.findAll<Tag>(
      table: DbTable.tags,
      entity: Tag(), // Provide a dummy instance
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
      entity: Tag(), // Provide a dummy instance
    );
  }
}
