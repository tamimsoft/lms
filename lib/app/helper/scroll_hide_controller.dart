// import 'package:flutter/widgets.dart';
// import 'package:lms/app/features/main/controllers/navigation_bar_controller.dart';
//
// class ScrollHideController {
//   final ScrollController controller;
//   double _lastOffset = 0;
//
//   ScrollHideController(this.controller) {
//     controller.addListener(_onScroll);
//   }
//
//   void _onScroll() {
//     final nav = NavigationBarController.instance;
//     final position = controller.position;
//
//     if (position.maxScrollExtent <= 0) return;
//
//     final currentOffset = controller.offset;
//
//     if (currentOffset > _lastOffset + 10) {
//       nav.isNavBarVisible.value = false;
//     } else if (currentOffset < _lastOffset - 10) {
//       nav.isNavBarVisible.value = true;
//     }
//
//     _lastOffset = currentOffset;
//   }
//
//   void dispose() {
//     controller.removeListener(_onScroll);
//     controller.dispose();
//   }
// }
