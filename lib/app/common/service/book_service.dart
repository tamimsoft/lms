// import 'package:get/get.dart';
// import 'package:lms/app/common/data/model/book.dart';
// import 'package:lms/app/common/data/model/book_details.dart';
// import 'package:lms/app/common/data/repository/book_repository.dart';
//
// class BookService {
//   final BookRepository _bookRepository = Get.find();
//
//   Future<List<Book>> getBooks({String? tagId, String? categoryId}) async {
//     return await _bookRepository.getAllBookByTagIdOrCategoryId(
//       tagId: tagId,
//       categoryId: categoryId,
//     );
//   }
//
//   Future<BookDetails?> getById({required String bId}) async {
//     return await _bookRepository.getBookDetailsById(bId: bId);
//   }
// }
