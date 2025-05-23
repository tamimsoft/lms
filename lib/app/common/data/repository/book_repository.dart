import 'package:lms/app/common/data/entity/book.dart';
import 'package:lms/app/core/services/database/app_db.dart';

class BookRepository {
  final AppDb _db;

  BookRepository(this._db);

  Future<List<Book>> getAll({
    String? tagId,
    String? categoryId,
    String? bookId,
    String? searchKey,
  }) async {
    final data = await _db.findAll<Book>(
      table: DbTable.books,
      entity: Book(), // Provide a dummy instance
      filters: [
        if (tagId != null && tagId.isNotEmpty)
          Filter(
            column: 'tage_ids',
            operator: Operator.contains,
            value: [tagId],
          ),
        if (categoryId != null && categoryId.isNotEmpty)
          Filter(
            column: 'category_ids',
            operator: Operator.contains,
            value: [categoryId],
          ),
        if (bookId != null && bookId.isNotEmpty)
          Filter(column: 'id', operator: Operator.eq, value: bookId),
      ],
    );
    return data;
  }

  Future<Book?> getById({required String id}) async {
    return await _db.findById<Book>(
      table: DbTable.books,
      id: id,
      entity: Book(), // Provide a dummy instance
    );
  }

  Future<List<Book>> getAllByIds({required List<String> ids}) async {
    return await _db.findAll<Book>(
      table: DbTable.books,
      filters: [Filter(column: 'id', operator: Operator.inFilter, value: ids)],
      entity: Book(), // Provide a dummy instance
    );
  }

  Future<List<Book>> getAllByTagId({required String tagId}) async {
    return await _db.findAll<Book>(
      table: DbTable.books,
      filters: [
        Filter(column: 'tage_ids', operator: Operator.contains, value: [tagId]),
      ],
      entity: Book(), // Provide a dummy instance
    );
  }

  Future<List<Book>> getAllByCategoryId({required String categoryId}) async {
    return await _db.findAll<Book>(
      table: DbTable.books,
      filters: [
        Filter(
          column: 'category_ids',
          operator: Operator.contains,
          value: [categoryId],
        ),
      ],
      entity: Book(), // Provide a dummy instance
    );
  }
}
