import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/config/routes/routes_name.dart';
import 'package:lms/app/features/profile/model/menu_item.dart';
import 'package:lms/app/features/profile/model/quick_action_item_model.dart';
import 'package:lms/app/features/profile/model/reading_stats_item_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final readingStats = [
    ReadingStatsItem(
      icon: Icons.auto_stories_outlined,
      label: 'Reading',
      value: '3',
      color: Color(0xFF3B82F6),
    ),
    ReadingStatsItem(
      icon: Icons.favorite_outline,
      label: 'Favorites',
      value: '7',
      color: Color(0xFFEF4444),
    ),
    ReadingStatsItem(
      icon: Icons.lock_clock_outlined,
      label: 'Returned',
      value: '12',
      color: Color(0xFFF59E0B),
    ),
    ReadingStatsItem(
      icon: Icons.calendar_month,
      label: 'Due Returns',
      value: '5',
      color: Color(0xFF10B981),
    ),
  ];

  final quickActions = [
    QuickActionItem(
      title: 'Reading History',
      description: 'View your reading progress & stats',
      icon: Icons.history,
      color: Color(0xFF8B5CF6),
      bg: Color(0xFFF5F3FF),
      route: '/reading-history',
    ),
    QuickActionItem(
      title: 'Reviews & Ratings',
      description: 'Manage your book reviews',
      icon: Icons.star,
      color: Color(0xFFFBBF24),
      bg: Color(0xFFFEFCE8),
      route: RoutesName.reviewAndRating,
    ),
    QuickActionItem(
      title: 'My Wishlist',
      description: 'Books you want to read',
      icon: Icons.bookmark_outline,
      color: Color(0xFF6366F1),
      bg: Color(0xFFEEF2FF),
      route: RoutesName.wishlist,
    ),
    QuickActionItem(
      title: 'Library Events',
      description: 'Upcoming events & activities',
      icon: Icons.event,
      color: Color(0xFF34D399),
      bg: Color(0xFFF0FDF4),
      route: '/events',
    ),
  ];

  final menuItems = [
    MenuItem(
      icon: Icons.settings,
      label: 'Account Settings,',
      route: RoutesName.settings,
    ),
    MenuItem(
      icon: Icons.notifications_outlined,
      label: 'Notifications',
      route: RoutesName.notifications,
    ),
    MenuItem(
      icon: Icons.help_outline,
      label: 'Help & Support',
      route: RoutesName.helpSupport,
    ),
    MenuItem(
      icon: Icons.logout,
      label: 'Log Out',
      route: RoutesName.loginOrSignUp,
      danger: true,
    ),
  ];
}

// class ProfileController extends GetxController {
//   static ProfileController get instance => Get.find<ProfileController>();
//
//   final SupabaseClient _client = Supabase.instance.client;
//
//   final Rx<UserModel?> user = Rx<UserModel?>(null);
//   final RxBool isLoading = false.obs;
//
//   @override
//   void onInit() {
//     fetchUserProfile();
//     super.onInit();
//   }
//
//   void updateUserProfile(String fullName, String phone) async {
//     try {
//       isLoading(true);
//
//       await _client.auth.updateUser(
//         UserAttributes(data: {'full_name': fullName, 'phone': phone}),
//       );
//
//       // Re-fetch updated data
//       fetchUserProfile();
//
//       Get.back();
//       Get.snackbar("Success", "Profile updated successfully");
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   void fetchUserProfile() async {
//     isLoading(true);
//     final currentUser = _client.auth.currentUser;
//     final userMetadata = currentUser?.userMetadata ?? {};
//
//     if (currentUser != null) {
//       user.value = UserModel(
//         id: currentUser.id,
//         email: currentUser.email ?? '',
//         fullName: userMetadata['full_name'],
//         phone: userMetadata['phone'],
//       );
//     }
//
//     isLoading(false);
//   }
//
//   Future<void> logout() async {
//     await _client.auth.signOut();
//     Get.offAllNamed(RoutesName.login); // Or your login route
//   }
// }
