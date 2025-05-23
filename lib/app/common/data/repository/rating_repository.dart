import 'package:lms/app/common/data/entity/rating.dart';
import 'package:lms/app/core/services/database/app_db.dart';

class RatingRepository {
  final AppDb _db;

  RatingRepository(this._db);

  Future<List<Rating>> getAll() async {
    final data = await _db.findAll<Rating>(
      table: DbTable.ratings,
      entity: Rating(), // Provide a dummy instance
    );
    return data;
  }

  Future<Rating?> getById({required String id}) async {
    return await _db.findById<Rating>(
      table: DbTable.ratings,
      id: id,
      entity: Rating(), // Provide a dummy instance
    );
  }

  Future<List<Rating>> getAllByIds({required List<String> ids}) async {
    return await _db.findAll<Rating>(
      table: DbTable.ratings,
      filters: [
        Filter(column: 'id', operator: Operator.inFilter, value: ids),
      ],
      entity: Rating(), // Provide a dummy instance
    );
  }

  Future<List<Rating>> getAllByBookId({required String bookId}) async {
    return await _db.findAll<Rating>(
      table: DbTable.ratings,
      filters: [
        Filter(column: 'book_id', operator: Operator.eq, value: bookId),
      ],
      entity: Rating(), // Provide a dummy instance
    );
  }
}
