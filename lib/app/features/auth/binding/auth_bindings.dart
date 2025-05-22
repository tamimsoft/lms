import 'package:get/instance_manager.dart';
import 'package:lms/app/common/data/repository/author_repository.dart';
import 'package:lms/app/common/data/repository/book_repository.dart';
import 'package:lms/app/common/data/repository/category_repository.dart';
import 'package:lms/app/common/data/repository/publication_repository.dart';
import 'package:lms/app/common/data/repository/rating_repository.dart';
import 'package:lms/app/common/data/repository/review_repository.dart';
import 'package:lms/app/common/data/repository/slide_repository.dart';
import 'package:lms/app/common/data/repository/tag_repository.dart';
import 'package:lms/app/common/data/repository/user_repository.dart';
import 'package:lms/app/core/services/database/online/supabase_db.dart';
import 'package:lms/app/core/services/database/online/supabase_db_impl.dart';
import 'package:lms/app/features/auth/controller/auth_controller.dart';
import 'package:lms/app/features/auth/service/auth_service.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SupabaseDb>(SupabaseDbImpl(), permanent: true);

    /// services
    Get.put<AuthService>(AuthService(), permanent: true);

    /// controllers
    Get.put<AuthController>(AuthController(), permanent: true);

    /// repositories
    Get.lazyPut<SlideRepository>(() => SlideRepository(Get.find()));
    Get.lazyPut<BookRepository>(() => BookRepository(Get.find()));
    Get.lazyPut<AuthorRepository>(() => AuthorRepository(Get.find()));
    Get.lazyPut<PublicationRepository>(() => PublicationRepository(Get.find()));
    Get.lazyPut<ReviewRepository>(() => ReviewRepository(Get.find()));
    Get.lazyPut<RatingRepository>(() => RatingRepository(Get.find()));
    Get.lazyPut<TagRepository>(() => TagRepository(Get.find()));
    Get.lazyPut<CategoryRepository>(() => CategoryRepository(Get.find()));
    Get.lazyPut<UserRepository>(() => UserRepository(Get.find()));
  }
}
