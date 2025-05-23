import 'package:lms/app/common/data/entity/publication.dart';
import 'package:lms/app/core/services/database/app_db.dart';

class PublicationRepository {
  final AppDb _db;

  PublicationRepository(this._db);

  Future<List<Publication>> getAll() async {
    final data = await _db.findAll<Publication>(
      table: DbTable.publications,
      entity: Publication(), // Provide a dummy instance
    );
    return data;
  }

  Future<Publication?> getById({required String id}) async {
    return await _db.findById<Publication>(
      table: DbTable.publications,
      id: id,
      entity: Publication(), // Provide a dummy instance
    );
  }

  Future<List<Publication>> getAllByIds({required List<String> ids}) async {
    return await _db.findAll<Publication>(
      table: DbTable.publications,
      filters: [
        Filter(column: 'id', operator: Operator.inFilter, value: ids),
      ],
      entity: Publication(), // Provide a dummy instance
    );
  }
}
