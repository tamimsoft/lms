// import 'package:store/app/features/book/data/model/category.dart';
// import 'package:store/app/common/widgets/widgets.dart';
// import 'package:store/app/config/routes/routes_name.dart';
// import 'package:store/app/core/constants/app_colors.dart';
//
// import 'package:flutter/material.dart';
//
// class CategoryItem extends StatelessWidget {
//   const CategoryItem({super.key, required this.book});
//
//   final CategoryModel book;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pushNamed(
//           context,
//           RoutesName.productList,
//           arguments: {
//             'title': book.name,
//             'categoryId': book.id,
//           } as Map,
//         );
//       },
//       child: Column(
//         spacing: 2,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: AppColors.primary.withValues(alpha: 0.1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: CustomNetworkImage(
//               imageUrl: book.image.toString(),
//               width: 36,
//               height: 36,
//             ),
//           ),
//           Text(
//             book.name.toString(),
//             style: const TextStyle(
//               color: AppColors.primary,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
