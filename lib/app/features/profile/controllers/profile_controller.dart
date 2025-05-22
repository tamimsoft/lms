import 'dart:ui';

import 'package:get/get.dart';
import 'package:lms/app/config/routes/routes_name.dart';
import 'package:lms/app/features/profile/model/reading_stats_item_model.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find<ProfileController>();

  final readingStats =
      [
        ReadingStatsItemModel(
          icon: LucideIcons.bookOpen,
          label: 'Reading',
          value: '3',
          color: Color(0xFF3B82F6),
        ),
        ReadingStatsItemModel(
          icon: LucideIcons.heart,
          label: 'Favorites',
          value: '7',
          color: Color(0xFFEF4444),
        ),
        ReadingStatsItemModel(
          icon: LucideIcons.clock,
          label: 'Returned',
          value: '12',
          color: Color(0xFFF59E0B),
        ),
        ReadingStatsItemModel(
          icon: LucideIcons.calendarClock,
          label: 'Due Returns',
          value: '5',
          color: Color(0xFF10B981),
        ),
      ];

  final menuItems = [
    {
      'icon': LucideIcons.settings,
      'label': 'Account Settings',
      'route': '/settings',
    },
    {
      'icon': LucideIcons.bell,
      'label': 'Notifications',
      'route': '/notifications',
    },
    {
      'icon': LucideIcons.helpCircle,
      'label': 'Help & Support',
      'route': '/help',
    },
    {
      'icon': LucideIcons.logOut,
      'label': 'Log Out',
      'route': RoutesName.loginOrSignUp,
      'danger': true,
    },
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
