import 'package:lms/app/common/data/entity/book.dart';
import 'package:lms/app/core/services/database/online/supabase_db.dart';

class BookRepository {
  final SupabaseDb _db;

  BookRepository(this._db);

  Future<List<Book>> getAll() async {
    final data = await _db.findAll<Book>(
      table: DbTable.books,
      entity: Book(), // Provide a dummy instance
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
      filters: [
        Filter(column: 'id', operator: FilterType.inFilter, value: ids),
      ],
      entity: Book(), // Provide a dummy instance
    );
  }

  Future<List<Book>> getAllByTageId({required String tageId}) async {
    return await _db.findAll<Book>(
      table: DbTable.books,
      filters: [
        Filter(
          column: 'tage_ids',
          operator: FilterType.contains,
          value: [tageId],
        ),
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
          operator: FilterType.contains,
          value: [categoryId],
        ),
      ],
      entity: Book(), // Provide a dummy instance
    );
  }
}
