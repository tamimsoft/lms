import 'package:lms/app/common/data/entity/book.dart';
import 'package:lms/app/core/services/database/online/supabase_db.dart';

class BookRepository with SupabaseDb {
  Future<List<Book>> getAll() async {
    final data = await findAll<Book>(
      table: DbTable.books,
      entity: Book(), // Provide a dummy instance
    );
    return data;
  }

  Future<Book?> getById({required String id}) async {
    return await findById<Book>(
      table: DbTable.books,
      id: id,
      entity: Book(), // Provide a dummy instance
    );
  }

  Future<List<Book>> getAllByIds({required List<String> ids}) async{
    return await findByFilter<Book>(
      table: DbTable.books,
      filter: Filter(column: 'id', operator: FilterType.inFilter, value: ids),
      entity: Book(), // Provide a dummy instance
    );
  }
  Future<List<Book>> getAllByTageId({required String tageId}) async{
    return await findByFilter<Book>(
      table: DbTable.books,
      filter: Filter(column: 'tage_ids', operator: FilterType.contains, value: [tageId]),
      entity: Book(), // Provide a dummy instance
    );
  }

}
