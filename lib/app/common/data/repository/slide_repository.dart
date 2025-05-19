import 'package:lms/app/common/data/entity/slide.dart';
import 'package:lms/app/core/services/database/online/supabase_db.dart';

class SlideRepository {
  final SupabaseDb _db;

  SlideRepository(this._db);

  Future<List<Slide>> getAll() async {
    final data = await _db.findAll<Slide>(
      table: DbTable.slides,
      entity: Slide(), // Provide a dummy instance
    );
    return data;
  }
}
