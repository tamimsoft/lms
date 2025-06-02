import 'package:get/get.dart';
import 'package:lms/app/common/data/model/review.dart';
import 'package:lms/app/common/data/repository/review_repository.dart';

class ReviewTemp {
  final String id;
  final String bookTitle;
  final String author;
  final String coverUrl;
  final double rating;
  final String review;
  final String date;
  final bool isMine;
  final String? reviewer;
  final int? likes;

  ReviewTemp({
    required this.id,
    required this.bookTitle,
    required this.author,
    required this.coverUrl,
    required this.rating,
    required this.review,
    required this.date,
    required this.isMine,
    this.reviewer,
    this.likes,
  });
}

class ReviewsController extends GetxController {
  static ReviewsController get instance => Get.find();
  final ReviewRepository _repository = Get.find();
  var activeTab = 'my-reviews'.obs;
  final RxList<Review> reviews = <Review>[].obs;
  final myReviews =
      <ReviewTemp>[
        ReviewTemp(
          id: '1',
          bookTitle: 'The Great Gatsby',
          author: 'F. Scott Fitzgerald',
          rating: 4.5,
          review:
              'A masterpiece of American literature. Fitzgerald\'s prose is beautiful and the story is timeless.',
          date: '2024-01-15',
          coverUrl:
              'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=400',
          isMine: true,
        ),
        ReviewTemp(
          id: '2',
          bookTitle: '1984',
          author: 'George Orwell',
          rating: 5.0,
          review:
              'Chilling and prophetic. More relevant today than ever before. A must-read for everyone.',
          date: '2024-01-01',
          coverUrl:
              'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=400',
          isMine: true,
        ),
      ].obs;

  final communityReviews =
      <ReviewTemp>[
        ReviewTemp(
          id: '3',
          bookTitle: 'Pride and Prejudice',
          author: 'Jane Austen',
          reviewer: 'Sarah M.',
          rating: 4.8,
          review:
              'Austen\'s wit and social commentary are brilliant. Elizabeth Bennet is one of literature\'s greatest heroines.',
          date: '2024-01-20',
          likes: 12,
          coverUrl:
              'https://images.unsplash.com/photo-1544947950-fa07a98d237f?auto=format&fit=crop&w=400',
          isMine: false,
        ),
        ReviewTemp(
          id: '4',
          bookTitle: 'The Catcher in the Rye',
          author: 'J.D. Salinger',
          reviewer: 'Mike D.',
          rating: 3.5,
          review:
              'Holden Caulfield is a fascinating character, though the story can feel a bit dated at times.',
          date: '2024-01-18',
          likes: 8,
          coverUrl:
              'https://images.unsplash.com/photo-1512820790803-83ca734da794?auto=format&fit=crop&w=400',
          isMine: false,
        ),
      ].obs;

  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final id = Get.parameters['id'];
    if (id != null) {
      fetchReviewsByBookId(id);
    }
  }

  Future<void> fetchReviewsByBookId(bookId) async {
    isLoading(true);
    try {
      reviews.value = await _repository.getAllByBookId(bookId: bookId);
    } finally {
      isLoading(false);
    }
  }
}
