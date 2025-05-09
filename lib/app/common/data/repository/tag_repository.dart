import 'package:lms/app/core/services/database/online/supabase_db.dart';
import 'package:lms/app/common/data/entity/tage.dart';

class TageRepository with SupabaseDb {
  Future<List<Tage>> getAll() async {
    final data = await findAll<Tage>(
      table: DbTable.tags,
      entity: Tage(), // Provide a dummy instance
    );
    return data;
  }

  Future<List<Tage>> getAllByIds({required List<String> ids}) async {
    return await findByFilter<Tage>(
      table: DbTable.tags,
      filter: Filter(column: 'id', operator: FilterType.inFilter, value: ids),
      entity: Tage(), // Provide a dummy instance
    );
  }
}
