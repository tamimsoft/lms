// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:lms/app/common/widgets/shimmer_placeholder.dart';
// import 'package:lms/app/features/home/controller/book_controller.dart';
// import 'package:lms/app/features/home/data/models/tag.dart';
//
// import 'section_header.dart';
//
// class BookList extends StatelessWidget {
//    BookList({super.key, required this.tag});
//
//   final TagModel tag;
//   final BookController _bookController = Get.put(BookController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SectionHeader(
//           title: tag.name,
//           onTap: () {
//             // Navigator.pushNamed(
//             //   context,
//             //   RoutesName.productList,
//             //   arguments:
//             //   {'title': tag.name, 'products': state.products} as Map,
//             // );
//           },
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Obx(() {
//             if (state.status == Status.success) {
//               return Row(
//                 spacing: 8,
//                 children:
//                     state.products
//                         .map((product) => BookItem(product: product))
//                         .toList(),
//               );
//             }
//             return Row(
//               spacing: 8,
//               children: List.generate(
//                 3,
//                 (index) => const ShimmerPlaceholder(width: 100, height: 100),
//               ),
//             );
//           }),
//         ),
//       ],
//     );
//   }
// }
