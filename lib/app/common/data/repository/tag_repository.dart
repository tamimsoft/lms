import 'package:lms/app/core/services/database/online/supabase_db.dart';
import 'package:lms/app/common/data/entity/tage.dart';

class TagRepository {
  final SupabaseDb _db;

  TagRepository(this._db);

  Future<List<Tage>> getAll() async {
    final data = await _db.findAll<Tage>(
      table: DbTable.tags,
      entity: Tage(), // Provide a dummy instance
    );
    return data;
  }

  Future<List<Tage>> getAllByIds({required List<String> ids}) async {
    return await _db.findAll<Tage>(
      table: DbTable.tags,
      filters: [
        Filter(column: 'id', operator: FilterType.inFilter, value: ids),
      ],
      entity: Tage(), // Provide a dummy instance
    );
  }
}
