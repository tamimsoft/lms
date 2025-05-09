import 'package:lms/app/common/data/entity/author.dart';
import 'package:lms/app/common/data/entity/book.dart';
import 'package:lms/app/common/data/entity/publication.dart';
import 'package:lms/app/common/data/entity/category.dart';
import 'package:lms/app/common/data/entity/rating.dart';
import 'package:lms/app/common/data/entity/review.dart';
import 'package:lms/app/common/data/entity/slide.dart';
import 'package:lms/app/common/data/entity/tage.dart';
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
  final SlideRepository _slideRepository = SlideRepository();
  final BookRepository _bookRepository = BookRepository();
  final AuthorRepository _authorRepository = AuthorRepository();
  final PublicationRepository _publicationRepository = PublicationRepository();
  final ReviewRepository _reviewRepository = ReviewRepository();
  final RatingRepository _ratingRepository = RatingRepository();
  final TageRepository _tagRepository = TageRepository();
  final CategoryRepository _categoryRepository = CategoryRepository();
  final UserRepository _userRepository = UserRepository();

  Future<List<BookModel>> getAllCarouselBooks() async {
    List<BookModel> books = [];
    try {
      final List<Slide> slideList = await _slideRepository.getAll();
      final List<String> bookIds =
          slideList.map((slide) => slide.bookId.toString()).toList();

      List<Book> bookEntities = await _bookRepository.getAllByIds(ids: bookIds);

      if (bookEntities.isNotEmpty) {
        for (Book bookEntity in bookEntities) {
          final List<Review> reviewEntities = await _reviewRepository
              .getAllByBookId(bookId: bookEntity.id!);
          final List<Rating> ratingEntities = await _ratingRepository
              .getAllByBookId(bookId: bookEntity.id!);

          final List<Author> authorEntities = await _authorRepository
              .getAllByIds(ids: bookEntity.authorIds!);
          final List<Tage> tagEntities = await _tagRepository.getAllByIds(
            ids: bookEntity.tageIds!,
          );

          final List<Publication> publicationEntities =
              await _publicationRepository.getAllByIds(
                ids: bookEntity.publicationIds!,
              );

          final List<Category> categoryEntities = await _categoryRepository
              .getAllByIds(ids: bookEntity.categoryIds!);

          final bool isFavorite = await _userRepository.isFavoriteBook(
            bookId: bookEntity.id!,
          );

          books.add(
            BookModel(
              id: bookEntity.id!,
              title: bookEntity.title!,
              slug: bookEntity.slug!,
              description: bookEntity.description!,
              coverUrl: bookEntity.coverUrl!,
              authors: authorEntities,
              tags: tagEntities,
              publications: publicationEntities,
              categories: categoryEntities,
              reviews: reviewEntities,
              ratings: ratingEntities,
              isFavorite: isFavorite,
            ),
          );
        }
      }

      return books;
    } catch (e) {
      return books;
    }
  }

  Future<Set<BookModel>> getTageWiseBooks({required String tageId}) async{
    Set<BookModel> books = {};
    try {

      List<Book> bookEntities = await _bookRepository.getAllByTageId(tageId: tageId);

      if (bookEntities.isNotEmpty) {
        for (Book bookEntity in bookEntities) {
          final List<Review> reviewEntities = await _reviewRepository
              .getAllByBookId(bookId: bookEntity.id!);
          final List<Rating> ratingEntities = await _ratingRepository
              .getAllByBookId(bookId: bookEntity.id!);

          final List<Author> authorEntities = await _authorRepository
              .getAllByIds(ids: bookEntity.authorIds!);
          final List<Tage> tagEntities = await _tagRepository.getAllByIds(
            ids: bookEntity.tageIds!,
          );

          final List<Publication> publicationEntities =
              await _publicationRepository.getAllByIds(
            ids: bookEntity.publicationIds!,
          );

          final List<Category> categoryEntities = await _categoryRepository
              .getAllByIds(ids: bookEntity.categoryIds!);

          final bool isFavorite = await _userRepository.isFavoriteBook(
            bookId: bookEntity.id!,
          );

          books.add(
            BookModel(
              id: bookEntity.id!,
              title: bookEntity.title!,
              slug: bookEntity.slug!,
              description: bookEntity.description!,
              coverUrl: bookEntity.coverUrl!,
              authors: authorEntities,
              tags: tagEntities,
              publications: publicationEntities,
              categories: categoryEntities,
              reviews: reviewEntities,
              ratings: ratingEntities,
              isFavorite: isFavorite,
            ),
          );
        }
      }

      return books;
    } catch (e) {
      print(e.toString());
      return books;
    }
  }
}
