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
  final PublicationRepository _publicationRepository =
      Get.find<PublicationRepository>();
  final ReviewRepository _reviewRepository = Get.find<ReviewRepository>();
  final RatingRepository _ratingRepository = Get.find<RatingRepository>();
  final TagRepository _tagRepository = Get.find<TagRepository>();
  final CategoryRepository _categoryRepository = Get.find<CategoryRepository>();
  final UserRepository _userRepository = Get.find<UserRepository>();

  Future<List<BookModel>> getBooks({String? tagId, String? categoryId, String? bookId, String? searchKey}) async {
    try {
      final List<Book> books = await _bookRepository.getAll(tagId: tagId, categoryId: categoryId, bookId: bookId, searchKey: searchKey);

      List<BookModel> bockModels = [];
      for (var book in books) {
        bockModels.add(await _buildBookModel(book));
      }
      return bockModels;
    } catch (e, stack) {
      debugPrint('Error building book models: $e');
      debugPrint(stack.toString());
      rethrow;
    }
  }

  Future<List<BookModel>> getAllCarouselBooks() async {
    try {
      final slides = await _slideRepository.getAll();
      final bookIds = slides.map((slide) => slide.bookId).toList();
      final books = await _bookRepository.getAllByIds(ids: bookIds);

      List<BookModel> bockModels = [];
      for (var book in books) {
        bockModels.add(await _buildBookModel(book));
      }
      return bockModels;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BookModel>> getTagWiseBooks({required String tagId}) async {
    try {
      final books = await _bookRepository.getAllByTagId(tagId: tagId);

      List<BookModel> bockModels = [];
      for (var book in books) {
        bockModels.add(await _buildBookModel(book));
      }
      return bockModels;
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
      List<BookModel> bockModels = [];
      for (var book in books) {
        bockModels.add(await _buildBookModel(book));
      }
      return bockModels;
    } catch (e) {
      rethrow;
    }
  }

  Future<BookModel?> getById({required String id}) async {
    final Book? book = await _bookRepository.getById(id: id);
    if (book != null) {
      return _buildBookModel(book);
    }

    return null;
  }

  Future<BookModel> _buildBookModel(Book book) async {
    final reviews = await _reviewRepository.getAllByBookId(bookId: book.id!);
    final ratings = await _ratingRepository.getAllByBookId(bookId: book.id!);
    final authors = await _authorRepository.getAllByIds(
      ids: book.authorIds ?? [],
    );
    final tags = await _tagRepository.getAllByIds(ids: book.tageIds ?? []);
    final publications = await _publicationRepository.getAllByIds(
      ids: book.publicationIds!,
    );
    final categories = await _categoryRepository.getAllByIds(
      ids: book.categoryIds!,
    );
    final isFavorite = await _userRepository.isFavoriteBook(bookId: book.id!);
    return BookModel(
      id: book.id!,
      title: book.title!,
      slug: book.slug!,
      description: book.description!,
      coverUrl: book.coverUrl!,
      pages: book.pages.toString(),
      publishedYear: book.publishedYear.toString(),
      authors: authors,
      tags: tags,
      publications: publications,
      categories: categories,
      reviews: reviews,
      ratings: ratings,
      isFavorite: isFavorite,
    );
  }
}
