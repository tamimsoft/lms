import 'package:lms/app/common/data/model/author.dart';
import 'package:lms/app/core/services/database/app_db.dart';

class AuthorRepository {
  final AppDb _db;

  AuthorRepository(this._db);

  Future<List<Author>> getAll() async {
    final data = await _db.findAll<Author>(
      table: DbTable.authors,
      fromJson: (json) => Author.fromJson(json),
      toJson: (a) => a.toJson(),
    );
    return data;
  }

  Future<Author?> getById({required String id}) async {
    return await _db.findById<Author>(
      table: DbTable.authors,
      id: id,
      fromJson: (json) => Author.fromJson(json),
      toJson: (a) => a.toJson(),
    );
  }

  Future<List<Author>> getAllByIds({required List<String> ids}) async {
    return await _db.findAll<Author>(
      table: DbTable.authors,
      filters: [Filter(column: 'id', operator: Operator.inFilter, value: ids)],
      fromJson: (json) => Author.fromJson(json),
      toJson: (a) => a.toJson(),
    );
  }

  Future<List<Author>> getAllByBookId({required String bookId}) async {
    return await _db.findAll<Author>(
      table: DbTable.authors,
      filters: [
        Filter(column: 'book_id', operator: Operator.eq, value: bookId),
      ],
      fromJson: (json) => Author.fromJson(json),
      toJson: (a) => a.toJson(),
    );
  }
}
