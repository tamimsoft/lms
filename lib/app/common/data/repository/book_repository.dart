import 'package:lms/app/common/data/model/book.dart';
import 'package:lms/app/common/data/model/book_details.dart';
import 'package:lms/app/core/services/database/app_db.dart';

class BookRepository {
  final AppDb _db;

  BookRepository(this._db);

  Future<BookDetails?> getBookDetailsById({required String bId}) async {
    final List<BookDetails> books = await _db.callRpc(
      functionName: 'get_book_with_details',
      params: {'bid': bId},
      fromJson: (json) => BookDetails.fromJson(json),
      toJson: (b) => b.toJson(),
    );
    return books.first;
  }

  Future<List<Book>> getAllBookByTagIdOrCategoryId({
    String? tagId,
    String? categoryId,
  }) async {
    return await _db.callRpc(
      functionName: 'get_books',
      fromJson: (json) => Book.fromJson(json),
      toJson: (b) => b.toJson(),
      params: {'tid': tagId, 'cid': categoryId},
    );
  }
}
