import 'package:lms/app/common/data/model/review.dart';
import 'package:lms/app/core/services/database/app_db.dart';

class ReviewRepository {
  final AppDb _db;

  ReviewRepository(this._db);

  Future<Review?> getById({required String id}) async {
    return await _db.findById<Review>(
      table: DbTable.reviews,
      id: id,
      fromJson: (json) => Review.fromJson(json),
      toJson: (item) => item.toJson(),
    );
  }

  Future<List<Review>> getAllByBookId({required String bookId}) async {
    return await _db.callRpc(
      functionName: 'get_book_reviews',
      fromJson: (json) => Review.fromJson(json),
      toJson: (r) => r.toJson(),
      params: {'bookid': bookId},
    );
  }
}
