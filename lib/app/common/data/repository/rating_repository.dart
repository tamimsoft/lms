import 'package:lms/app/common/data/entity/rating.dart';
import 'package:lms/app/core/services/database/online/supabase_db.dart';

class RatingRepository with SupabaseDb {
  Future<List<Rating>> getAll() async {
    final data = await findAll<Rating>(
      table: DbTable.ratings,
      entity: Rating(), // Provide a dummy instance
    );
    return data;
  }

  Future<Rating?> getById({required String id}) async {
    return await findById<Rating>(
      table: DbTable.ratings,
      id: id,
      entity: Rating(), // Provide a dummy instance
    );
  }

  Future<List<Rating>> getAllByIds({required List<String> ids}) async {
    return await findByFilter<Rating>(
      table: DbTable.ratings,
      filter: Filter(column: 'id', operator: FilterType.inFilter, value: ids),
      entity: Rating(), // Provide a dummy instance
    );
  }

  Future<List<Rating>> getAllByBookId({required String bookId}) async {
    return await findByFilter<Rating>(
      table: DbTable.ratings,
      filter: Filter(
        column: 'book_id',
        operator: FilterType.eqFilter,
        value: bookId,
      ),
      entity: Rating(), // Provide a dummy instance
    );
  }
}
