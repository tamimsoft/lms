import 'package:get/get.dart';
import 'package:lms/app/features/auth/binding/auth_bindings.dart';
import 'package:lms/app/features/auth/page/sign_in_sign_up_page.dart';
import 'package:lms/app/features/auth/page/splash_page.dart';
import 'package:lms/app/features/book/binding/book_bindings.dart';
import 'package:lms/app/features/book/page/book_details_page.dart';
import 'package:lms/app/features/book/page/book_page.dart';
import 'package:lms/app/features/home/binding/home_bindings.dart';
import 'package:lms/app/features/home/page/home_page.dart';
import 'package:lms/app/features/main/binding/main_bindings.dart';
import 'package:lms/app/features/main/main_bottom_nav_bar.dart';
import 'package:lms/app/features/profile/page/profile_page.dart';

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
      binding: BookBindings(),
    ),
    GetPage(name: RoutesName.profile, page: () => ProfilePage()),
    // GetPage(name: RoutesName.editProfile, page: () => EditProfileScreen()),
  ];
}
