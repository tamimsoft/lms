import 'package:get/get.dart';
import 'package:lms/app/features/auth/screens/login_screen.dart';
import 'package:lms/app/features/auth/screens/signup_screen.dart';
import 'package:lms/app/features/auth/screens/splash_screen.dart';
import 'package:lms/app/features/main/main_bottom_nav_bar_screen.dart';
import 'package:lms/app/features/profile/widgets/edit_profile_screen.dart' show EditProfileScreen;

import '../../features/profile/profile_screen.dart';
import 'routes_name.dart';

class AppRoutes {
  AppRoutes._();

  static get routes => [
    GetPage(name: RoutesName.initial, page: () => SplashScreen()),
    GetPage(name: RoutesName.main, page: () => MainBottomNavBarScreen()),
    GetPage(name: RoutesName.login, page: () => LoginScreen()),
    GetPage(name: RoutesName.signup, page: () => SignupScreen()),
    GetPage(name: RoutesName.profile, page: () => ProfileScreen()),
    GetPage(name: RoutesName.editProfile, page: () => EditProfileScreen()),
  ];
}
