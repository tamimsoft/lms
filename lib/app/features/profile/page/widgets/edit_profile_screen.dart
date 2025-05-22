// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lms/app/core/constants/app_colors.dart';
// import 'package:lms/app/features/profile/controllers/profile_controller.dart';
//
// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key});
//
//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final ProfileController controller = Get.put(ProfileController());
//
//   late TextEditingController nameController;
//   late TextEditingController phoneController;
//
//   @override
//   void initState() {
//     super.initState();
//     final user = controller.user.value;
//
//     nameController = TextEditingController(text: user?.fullName ?? '');
//     phoneController = TextEditingController(text: user?.phone ?? '');
//   }
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     phoneController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Edit Profile"),
//         backgroundColor: AppColors.primary,
//         foregroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: const InputDecoration(
//                 labelText: 'Full Name',
//                 prefixIcon: Icon(Icons.person),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               controller: phoneController,
//               decoration: const InputDecoration(
//                 labelText: 'Phone Number',
//                 prefixIcon: Icon(Icons.phone),
//               ),
//               keyboardType: TextInputType.phone,
//             ),
//             const SizedBox(height: 24),
//             Obx(() => ElevatedButton.icon(
//               onPressed: controller.isLoading.value
//                   ? null
//                   : () {
//                 controller.updateUserProfile(
//                   nameController.text,
//                   phoneController.text,
//                 );
//               },
//               icon: const Icon(Icons.save),
//               label: controller.isLoading.value
//                   ? const SizedBox(
//                 width: 16,
//                 height: 16,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2,
//                   color: Colors.white,
//                 ),
//               )
//                   : const Text("Save Changes"),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }