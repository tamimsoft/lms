import 'package:lms/app/common/data/entity/review.dart';
import 'package:lms/app/core/services/database/online/supabase_db.dart';

class ReviewRepository {
  final SupabaseDb _db;

  ReviewRepository(this._db);

  Future<List<Review>> getAll() async {
    final data = await _db.findAll<Review>(
      table: DbTable.reviews,
      entity: Review(), // Provide a dummy instance
    );
    return data;
  }

  Future<Review?> getById({required String id}) async {
    return await _db.findById<Review>(
      table: DbTable.reviews,
      id: id,
      entity: Review(), // Provide a dummy instance
    );
  }

  Future<List<Review>> getAllByIds({required List<String> ids}) async {
    return await _db.findAll<Review>(
      table: DbTable.reviews,
      filters: [
        Filter(column: 'id', operator: Operator.inFilter, value: ids),
      ],
      entity: Review(), // Provide a dummy instance
    );
  }

  Future<List<Review>> getAllByBookId({required String bookId}) async {
    return await _db.findAll<Review>(
      table: DbTable.reviews,
      filters: [
        Filter(column: 'book_id', operator: Operator.eq, value: bookId),
      ],
      entity: Review(), // Provide a dummy instance
    );
  }
}
