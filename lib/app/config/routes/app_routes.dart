import 'package:get/get.dart';
import 'package:lms/app/features/auth/binding/initial_bindings.dart';
import 'package:lms/app/features/auth/page/sign_in_sign_up_page.dart';
import 'package:lms/app/features/auth/page/splash_page.dart';
import 'package:lms/app/features/main/main_bottom_nav_bar.dart';
import 'package:lms/app/features/profile/profile_screen.dart';
import 'package:lms/app/features/profile/widgets/edit_profile_screen.dart';

import 'routes_name.dart';

class AppRoutes {
  AppRoutes._();

  static get routes => [
    GetPage(
      name: RoutesName.initial,
      page: () => SplashPage(),
      binding: InitialBindings(),
    ),
    GetPage(name: RoutesName.main, page: () => MainBottomNavBar()),
    GetPage(name: RoutesName.login, page: () => LoginPage()),
    GetPage(name: RoutesName.profile, page: () => ProfileScreen()),
    GetPage(name: RoutesName.editProfile, page: () => EditProfileScreen()),
  ];
}
