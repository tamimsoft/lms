import 'package:lms/app/core/services/database/online/supabase_db.dart';
import 'package:lms/app/features/home/data/model/book_model.dart';

class BookRepository with SupabaseDb {
  Future<void> deleteBook({required String id}) async {
    await delete(table: Table.books, id: id);
  }

  Future<List<BookModel>> getAllBooks() async {
    final data = await getAll<BookModel>(
      table: Table.books,
      model: BookModel(), // Provide a dummy instance
    );
    return data;
  }

  Future<BookModel?> getBookById({required String id}) async {
    return await getById<BookModel>(
      table: Table.books,
      id: id,
      model: BookModel(), // Provide a dummy instance
    );
  }

  Future<void> createNewBook({required BookModel item}) async {
    await insert(table: Table.books, data: item.toJson());
  }

  Future<void> updateBook({required String id, required BookModel item}) async {
    await update(table: Table.books, id: id, data: item.toJson());
  }
}
