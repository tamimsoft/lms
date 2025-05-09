import 'package:lms/app/common/data/entity/publication.dart';
import 'package:lms/app/core/services/database/online/supabase_db.dart';

class PublicationRepository with SupabaseDb {
  Future<List<Publication>> getAll() async {
    final data = await findAll<Publication>(
      table: DbTable.publications,
      entity: Publication(), // Provide a dummy instance
    );
    return data;
  }

  Future<Publication?> getById({required String id}) async {
    return await findById<Publication>(
      table: DbTable.publications,
      id: id,
      entity: Publication(), // Provide a dummy instance
    );
  }

  Future<List<Publication>> getAllByIds({required List<String> ids}) async {
    return await findByFilter<Publication>(
      table: DbTable.publications,
      filter: Filter(column: 'id', operator: FilterType.inFilter, value: ids),
      entity: Publication(), // Provide a dummy instance
    );
  }
}
