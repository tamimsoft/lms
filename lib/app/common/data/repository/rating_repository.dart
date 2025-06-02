import 'package:lms/app/common/data/model/rating.dart';
import 'package:lms/app/core/services/database/app_db.dart';

class RatingRepository {
  final AppDb _db;

  RatingRepository(this._db);

  Future<List<Rating>> getAll() async {
    final data = await _db.findAll<Rating>(
      table: DbTable.ratings,
      fromJson: (json) => Rating.fromJson(json),
      toJson: (item) => item.toJson(),
    );
    return data;
  }

  Future<Rating?> getById({required String id}) async {
    return await _db.findById<Rating>(
      table: DbTable.ratings,
      id: id,
      fromJson: (json) => Rating.fromJson(json),
      toJson: (item) => item.toJson(),
    );
  }

  Future<List<Rating>> getAllByIds({required List<String> ids}) async {
    return await _db.findAll<Rating>(
      table: DbTable.ratings,
      filters: [
        Filter(column: 'id', operator: Operator.inFilter, value: ids),
      ],
      fromJson: (json) => Rating.fromJson(json),
      toJson: (item) => item.toJson(),
    );
  }

  Future<List<Rating>> getAllByBookId({required String bookId}) async {
    return await _db.findAll<Rating>(
      table: DbTable.ratings,
      filters: [
        Filter(column: 'book_id', operator: Operator.eq, value: bookId),
      ],
      fromJson: (json) => Rating.fromJson(json),
      toJson: (item) => item.toJson(),
    );
  }
}
