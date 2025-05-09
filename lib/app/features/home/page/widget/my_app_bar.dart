// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:lms/app/core/constants/image_path.dart';
//
// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const MyAppBar({
//     super.key,
//     required this.scaffoldKey,
//   });
//
//   final GlobalKey<ScaffoldState> scaffoldKey;
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.white,
//       title: SvgPicture.asset(ImagePath.logoNavSvg),
//       actions: [
//         AppBarIconButton(
//           icon: Icons.notifications_active_outlined,
//           onTap: () {},
//         ),
//         const SizedBox(width: 8),
//         AppBarIconButton(
//           icon: Icons.person_2_outlined,
//           onTap: () {
//             scaffoldKey.currentState?.openEndDrawer();
//           },
//         ),
//         const SizedBox(width: 16),
//       ],
//       leadingWidth: double.maxFinite,
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
