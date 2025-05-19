import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/data/entity/book.dart';
import 'package:lms/app/common/data/model/book_model.dart';
import 'package:lms/app/common/data/repository/author_repository.dart';
import 'package:lms/app/common/data/repository/book_repository.dart';
import 'package:lms/app/common/data/repository/category_repository.dart';
import 'package:lms/app/common/data/repository/publication_repository.dart';
import 'package:lms/app/common/data/repository/rating_repository.dart';
import 'package:lms/app/common/data/repository/review_repository.dart';
import 'package:lms/app/common/data/repository/slide_repository.dart';
import 'package:lms/app/common/data/repository/tag_repository.dart';
import 'package:lms/app/common/data/repository/user_repository.dart';

class BookService {
  final SlideRepository _slideRepository = Get.find<SlideRepository>();
  final BookRepository _bookRepository = Get.find<BookRepository>();
  final AuthorRepository _authorRepository = Get.find<AuthorRepository>();
  final PublicationRepository _publicationRepository = Get.find<PublicationRepository>();
  final ReviewRepository _reviewRepository = Get.find<ReviewRepository>();
  final RatingRepository _ratingRepository = Get.find<RatingRepository>();
  final TagRepository _tagRepository = Get.find<TagRepository>();
  final CategoryRepository _categoryRepository = Get.find<CategoryRepository>();
  final UserRepository _userRepository = Get.find<UserRepository>();

  Future<List<BookModel>> getAllBooks() async {
    try {
      final List<Book> bookEntities = await _bookRepository.getAll();
      debugPrint('Fetched ${bookEntities.length} book entities');
      List<BookModel> b = await _buildBookModels(bookEntities);
      debugPrint('Built ${b.length} book models');
      return b;
    } catch (e, stack) {
      debugPrint('Error building book models: $e');
      debugPrint(stack.toString());
      rethrow;
    }
  }

  Future<List<BookModel>> getAllCarouselBooks() async {
    try {
      final slideList = await _slideRepository.getAll();
      final bookIds =
          slideList.map((slide) => slide.bookId).toList();
      final books = await _bookRepository.getAllByIds(ids: bookIds);
      return await _buildBookModels(books);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BookModel>> getTagWiseBooks({required String tageId}) async {
    try {
      final books = await _bookRepository.getAllByTageId(tageId: tageId);
      return await _buildBookModels(books);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BookModel>> getCategoryWiseBooks({
    required String categoryId,
  }) async {
    try {
      final books = await _bookRepository.getAllByCategoryId(
        categoryId: categoryId,
      );
      return await _buildBookModels(books);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BookModel>> _buildBookModels(List<Book> bookEntities) async {
    List<BookModel> books = [];

    for (var book in bookEntities) {
      final reviews = await _reviewRepository.getAllByBookId(bookId: book.id!);
      final ratings = await _ratingRepository.getAllByBookId(bookId: book.id!);
      final authors = await _authorRepository.getAllByIds(ids: book.authorIds?? []);
      debugPrint(book.authorIds.toString());
      debugPrint(authors.length.toString());
      final tags = await _tagRepository.getAllByIds(ids: book.tageIds?? []);
      final publications = await _publicationRepository.getAllByIds(
        ids: book.publicationIds!,
      );
      final categories = await _categoryRepository.getAllByIds(
        ids: book.categoryIds!,
      );
      final isFavorite = await _userRepository.isFavoriteBook(bookId: book.id!);

      books.add(
        BookModel(
          id: book.id!,
          title: book.title!,
          slug: book.slug!,
          description: book.description!,
          coverUrl: book.coverUrl!,
          authors: authors,
          tags: tags,
          publications: publications,
          categories: categories,
          reviews: reviews,
          ratings: ratings,
          isFavorite: isFavorite,
        ),
      );
    }

    return books;
  }
}
