import 'package:lms/app/common/data/entity/user.dart';
import 'package:lms/app/core/services/database/online/supabase_db.dart';

class UserRepository with SupabaseDb {
  Future<List<User>> getAll() async {
    final data = await findAll<User>(
      table: DbTable.users,
      entity: User(), // Provide a dummy instance
    );
    return data;
  }

  Future<User?> getById({required String id}) async {
    final data = await findById<User>(
      table: DbTable.users,
      id: id,
      entity: User(),
      // Provide a dummy instance
    );
    return data;
  }

  Future<List<User>> getAllByIds({required List<String> ids}) async {
    return await findByFilter<User>(
      table: DbTable.users,
      filter: Filter(column: 'id', operator: FilterType.inFilter, value: ids),
      entity: User(), // Provide a dummy instance
    );
  }

 Future<bool> isFavoriteBook({required String bookId}) async{
    final data = await findByFilter<User>(
      table: DbTable.users,
      filter: Filter(column: 'favorite_book_ids', operator: FilterType.contains, value: [bookId]),
      entity: User(), // Provide a dummy instance
    );
    return data.isNotEmpty;
 }
}
