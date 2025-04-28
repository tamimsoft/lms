import 'package:get/get.dart';
import 'package:lms/app/config/routes/routes_name.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find<ProfileController>();

  final SupabaseClient _client = Supabase.instance.client;

  final Rx<UserModel?> user = Rx<UserModel?>(null);
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchUserProfile();
    super.onInit();
  }

  void updateUserProfile(String fullName, String phone) async {
    try {
      isLoading(true);

      await _client.auth.updateUser(
        UserAttributes(data: {'full_name': fullName, 'phone': phone}),
      );

      // Re-fetch updated data
      fetchUserProfile();

      Get.back();
      Get.snackbar("Success", "Profile updated successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  void fetchUserProfile() async {
    isLoading(true);
    final currentUser = _client.auth.currentUser;
    final userMetadata = currentUser?.userMetadata ?? {};

    if (currentUser != null) {
      user.value = UserModel(
        id: currentUser.id,
        email: currentUser.email ?? '',
        fullName: userMetadata['full_name'],
        phone: userMetadata['phone'],
      );
    }

    isLoading(false);
  }

  Future<void> logout() async {
    await _client.auth.signOut();
    Get.offAllNamed(RoutesName.login); // Or your login route
  }
}
