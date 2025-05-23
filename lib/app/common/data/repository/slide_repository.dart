import 'package:lms/app/common/data/entity/slide.dart';
import 'package:lms/app/core/services/database/app_db.dart';

class SlideRepository {
  final AppDb _db;

  SlideRepository(this._db);

  Future<List<Slide>> getAll() async {
    final data = await _db.findAll<Slide>(
      table: DbTable.slides,
      entity: Slide(), // Provide a dummy instance
    );
    return data;
  }
}
