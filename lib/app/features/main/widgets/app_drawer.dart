// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'package:lms/app/config/routes/routes_name.dart';
// import 'package:lms/app/core/constants/app_colors.dart';
// import 'package:lms/app/features/main/controllers/drawer_controller.dart';
//
// class AppDrawer extends GetView<AppDrawerController> {
//   const AppDrawer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: [
//           const DrawerHeader(
//             // decoration: BoxDecoration(color: Colors.blue),
//             child: Text(
//               "Drawer Header",
//               style: TextStyle(color: Colors.black, fontSize: 20),
//             ),
//           ),
//
//           _buildMenuItem(
//             context,
//             Icons.logout,
//             "Logout",
//             RoutesName.login,
//             controller.selectedItem.value,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildMenuItem(
//     BuildContext context,
//     IconData icon,
//     String label,
//     String route,
//     String selectedItem,
//   ) {
//     return ListTile(
//       // selectedTileColor: AppColors.greyLight,
//       selected: label == selectedItem,
//       leading: Icon(icon),
//       title: Text(label),
//       onTap: () {
//         controller.selectItem(label);
//         Get.toNamed(route);
//       },
//     );
//   }
// }
