import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:lms/app/features/profile/controllers/profile_controller.dart';
import 'widgets/reading_activity.dart';
import 'widgets/settings.dart';
import 'widgets/user_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = ProfileController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            UserInfo(),

            const SizedBox(height: 24),
            ReadingActivity(controller: controller),

            const SizedBox(height: 16),
            Settings(controller: controller),
          ],
        ),
      ),
    );
  }
}
