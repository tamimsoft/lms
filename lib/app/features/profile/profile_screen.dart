import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/core/constants/app_colors.dart';
import 'package:lms/app/core/constants/image_path.dart';
import 'package:lms/app/features/profile/controllers/profile_controller.dart';

import 'widgets/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    controller.fetchUserProfile();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        foregroundColor: Colors.black,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final user = controller.user.value;

        return user == null
            ? const Center(child: Text("No user found"))
            : SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
               CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(ImagePath.profileImage),
              ),
              const SizedBox(height: 16),
              Obx(() {
                final user = ProfileController.instance.user.value;

                return Text(
                  user?.fullName ?? "No Name",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),

              const SizedBox(height: 6),
              Text(
                user.email,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // Followers Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStat("250", "Reviews"),
                  _buildStat("100k", "Followers"),
                  _buildStat("30", "Following"),
                ],
              ),
              const SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Get.to(() => EditProfileScreen()),
                      child: const Text("Edit Profile"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // Settings action
                      },
                      child: const Text("Settings"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Example content card (like food post)
              _buildSampleCard(context),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.grey.shade600),
        ),
      ],
    );
  }

  Widget _buildSampleCard(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(ImagePath.coverPhoto1, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "The Robot Warrior",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(ImagePath.coverPhoto3, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "2099 : Halycon",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}