import 'package:lms/app/common/data/entity/slide.dart';
import 'package:lms/app/core/services/database/online/supabase_db.dart';

class SlideRepository with SupabaseDb {
  Future<List<Slide>> getAll() async {
    final data = await findAll<Slide>(
      table: DbTable.slides,
      entity: Slide(), // Provide a dummy instance
    );
    return data;
  }
}
