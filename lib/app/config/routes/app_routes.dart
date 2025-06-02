import 'package:get/get.dart';
import 'package:lms/app/features/auth/binding/auth_bindings.dart';
import 'package:lms/app/features/auth/page/sign_in_sign_up_page.dart';
import 'package:lms/app/features/auth/page/splash_page.dart';
import 'package:lms/app/features/book/binding/book_bindings.dart';
import 'package:lms/app/features/book/page/add_edit_book_page.dart';
import 'package:lms/app/features/book/page/book_page.dart';
import 'package:lms/app/features/book_details/binding/book_details_bindings.dart';
import 'package:lms/app/features/book_details/page/book_details_page.dart';
import 'package:lms/app/features/book_details/page/book_preview_page.dart';
import 'package:lms/app/features/borrowing/binding/borrowing_bindings.dart';
import 'package:lms/app/features/borrowing/page/borrowing_page.dart';
import 'package:lms/app/features/home/binding/home_bindings.dart';
import 'package:lms/app/features/home/page/home_page.dart';
import 'package:lms/app/features/main/binding/main_bindings.dart';
import 'package:lms/app/features/main/main_bottom_nav_bar.dart';
import 'package:lms/app/features/notifications/binding/notification_bindings.dart';
import 'package:lms/app/features/notifications/page/notifications_page.dart';
import 'package:lms/app/features/profile/page/account_settings_page.dart';
import 'package:lms/app/features/profile/page/activity_page.dart';
import 'package:lms/app/features/profile/page/help_support_page.dart';
import 'package:lms/app/features/profile/page/profile_page.dart';
import 'package:lms/app/features/reviews/binding/review_bindings.dart';
import 'package:lms/app/features/reviews/page/reviews_page.dart';
import 'package:lms/app/features/wishlist/binding/wishlist_bindings.dart';
import 'package:lms/app/features/wishlist/page/wishlist_page.dart';

import 'routes_name.dart';

class AppRoutes {
  AppRoutes._();

  static get routes => [
    GetPage(
      name: RoutesName.initial,
      page: () => SplashPage(),
      binding: AuthBindings(),
    ),
    GetPage(name: RoutesName.loginOrSignUp, page: () => LoginAndSignUpPage()),
    GetPage(
      name: RoutesName.main,
      page: () => MainBottomNavBar(),
      binding: MainBindings(),
    ),
    GetPage(
      name: RoutesName.home,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RoutesName.book,
      page: () => BookPage(),
      binding: BookBindings(),
    ),
    GetPage(
      name: '${RoutesName.bookDetail}/:id',
      page: () => BookDetailPage(),
      binding: BookDetailsBindings(),
    ),
    GetPage(name: RoutesName.bookPreview, page: () => BookPreviewPage()),
    GetPage(name: RoutesName.bookAddEdit, page: () => AddEditBookPage()),

    GetPage(
      name: RoutesName.wishlist,
      page: () => WishlistPage(),
      binding: WishlistBindings(),
    ),
    GetPage(
      name: RoutesName.borrowings,
      page: () => BorrowingPage(),
      binding: BorrowingBindings(),
    ),

    GetPage(name: RoutesName.profile, page: () => ProfilePage()),
    GetPage(name: RoutesName.userActivity, page: () => ActivityHistoryPage()),
    GetPage(
      name: RoutesName.accountSettings,
      page: () => AccountSettingsPage(),
    ),
    GetPage(
      name: RoutesName.reviewAndRating,
      page: () => ReviewsPage(),
      binding: ReviewBindings(),
    ),
    GetPage(name: RoutesName.helpSupport, page: () => HelpSupportPage()),

    GetPage(
      name: RoutesName.notifications,
      page: () => NotificationsPage(),
      binding: NotificationBindings(),
    ),
  ];
}
