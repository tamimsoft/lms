import 'package:lms/app/common/data/entity/review.dart';
import 'package:lms/app/core/services/database/online/supabase_db.dart';

class ReviewRepository with SupabaseDb {
  Future<List<Review>> getAll() async {
    final data = await findAll<Review>(
      table: DbTable.reviews,
      entity: Review(), // Provide a dummy instance
    );
    return data;
  }

  Future<Review?> getById({required String id}) async {
    return await findById<Review>(
      table: DbTable.reviews,
      id: id,
      entity: Review(), // Provide a dummy instance
    );
  }

  Future<List<Review>> getAllByIds({required List<String> ids}) async {
    return await findByFilter<Review>(
      table: DbTable.reviews,
      filter: Filter(column: 'id', operator: FilterType.inFilter, value: ids),
      entity: Review(), // Provide a dummy instance
    );
  }

  Future<List<Review>> getAllByBookId({required String bookId}) async {
    return await findByFilter<Review>(
      table: DbTable.reviews,
      filter: Filter(
        column: 'book_id',
        operator: FilterType.eqFilter,
        value: bookId,
      ),
      entity: Review(), // Provide a dummy instance
    );
  }
}
