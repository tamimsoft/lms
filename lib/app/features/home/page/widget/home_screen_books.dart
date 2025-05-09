// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lms/app/common/widgets/shimmer_placeholder.dart';
// import 'package:lms/app/features/home/controller/tag_controller.dart';
//
// import 'section_header.dart';
//
// class HomeScreenBooks extends StatelessWidget {
//    HomeScreenBooks({super.key});
//
//   final TagController _controller = Get.put(TagController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (!_controller.isLoading.value && _controller.tagList.isNotEmpty) {
//         return Column(
//           children: [
//             for (final tag in _controller.tagList) BookList(tag: tag),
//           ],
//         );
//       }
//       return _buildTagShimmerList();
//     });
//   }
//
//   Widget _buildTagShimmerList() {
//     return Column(
//       children: [
//         for (int i = 0; i < 3; i++)
//           Column(
//             children: [
//               // Shimmer effect on SectionHeader title
//               ShimmerPlaceholder(
//                 child: SectionHeader(
//                   title: 'Product', // Replace with actual tag name when ready
//                   onTap: () {},
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   spacing: 8,
//                   children: List.generate(
//                     3,
//                     (index) =>
//                         const ShimmerPlaceholder(width: 100, height: 100),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//       ],
//     );
//   }
// }
