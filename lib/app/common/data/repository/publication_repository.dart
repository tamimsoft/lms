import 'package:lms/app/common/data/model/publication.dart';
import 'package:lms/app/core/services/database/app_db.dart';

class PublicationRepository {
  final AppDb _db;

  PublicationRepository(this._db);

  Future<List<Publication>> getAll() async {
    final data = await _db.findAll<Publication>(
      table: DbTable.publications,
      fromJson: (json) => Publication.fromJson(json),
      toJson: (item) => item.toJson(),
    );
    return data;
  }

  Future<Publication?> getById({required String id}) async {
    return await _db.findById<Publication>(
      table: DbTable.publications,
      id: id,
      fromJson: (json) => Publication.fromJson(json),
      toJson: (item) => item.toJson(),
    );
  }

  Future<List<Publication>> getAllByIds({required List<String> ids}) async {
    return await _db.findAll<Publication>(
      table: DbTable.publications,
      filters: [
        Filter(column: 'id', operator: Operator.inFilter, value: ids),
      ],
      fromJson: (json) => Publication.fromJson(json),
      toJson: (item) => item.toJson(),
    );
  }
}
