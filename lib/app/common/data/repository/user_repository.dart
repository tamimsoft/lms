import 'package:lms/app/common/data/entity/user.dart';
import 'package:lms/app/core/services/database/online/supabase_db.dart';

class UserRepository {
  final SupabaseDb _db;

  UserRepository(this._db);

  Future<List<User>> getAll() async {
    final data = await _db.findAll<User>(
      table: DbTable.users,
      entity: User(), // Provide a dummy instance
    );
    return data;
  }

  Future<User?> getById({required String id}) async {
    final data = await _db.findById<User>(
      table: DbTable.users,
      id: id,
      entity: User(),
      // Provide a dummy instance
    );
    return data;
  }

  Future<List<User>> getAllByIds({required List<String> ids}) async {
    return await _db.findAll<User>(
      table: DbTable.users,
      filters: [
        Filter(column: 'id', operator: Operator.inFilter, value: ids),
      ],
      entity: User(), // Provide a dummy instance
    );
  }

  Future<bool> isFavoriteBook({required String bookId}) async {
    final data = await _db.findAll<User>(
      table: DbTable.users,
      filters: [
        Filter(
          column: 'favorite_book_ids',
          operator: Operator.contains,
          value: [bookId],
        ),
      ],
      entity: User(), // Provide a dummy instance
    );
    return data.isNotEmpty;
  }
}
