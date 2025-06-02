import 'package:lms/app/common/data/model/user.dart';
import 'package:lms/app/core/services/database/app_db.dart';

class UserRepository {
  final AppDb _db;

  UserRepository(this._db);

  Future<List<User>> getAll() async {
    final data = await _db.findAll<User>(
      table: DbTable.users,
      fromJson: (json) => User.fromJson(json),
      toJson: (item) => item.toJson(),
    );
    return data;
  }

  Future<User?> getById({required String id}) async {
    final data = await _db.findById<User>(
      table: DbTable.users,
      id: id,
      fromJson: (json) => User.fromJson(json),
      toJson: (item) => item.toJson(),
    );
    return data;
  }

  Future<List<User>> getAllByIds({required List<String> ids}) async {
    return await _db.findAll<User>(
      table: DbTable.users,
      filters: [Filter(column: 'id', operator: Operator.inFilter, value: ids)],
      fromJson: (json) => User.fromJson(json),
      toJson: (item) => item.toJson(),
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
      fromJson: (json) => User.fromJson(json),
      toJson: (item) => item.toJson(),
    );
    return data.isNotEmpty;
  }
}
