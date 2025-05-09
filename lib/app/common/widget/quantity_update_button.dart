
// import '../../core/constants/app_colors.dart';
// import 'package:flutter/material.dart';

// class QuantityUpdateButton extends StatelessWidget {
//   const QuantityUpdateButton(
//       {super.key, required this.productId, this.cartQuantity});

//   final String productId;
//   final int? cartQuantity;

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return BlocBuilder<CartBloc, CartState>(
//       builder: (context, state) {
//         final int quantity = state.quantities[productId] ??
//             (cartQuantity != null ? cartQuantity! : 1);
//         return Row(
//           children: [
//             _buildCustomButton(
//               icon: Icons.add,
//               onTap: () {
//                 quantity < 20
//                     ? context
//                         .read<CartBloc>()
//                         .add(CartEventIncrementQuantity(productId: productId))
//                     : null;
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: Text(
//                 quantity.toString(),
//                 style: textTheme.titleMedium,
//               ),
//             ),
//             _buildCustomButton(
//               icon: Icons.remove,
//               onTap: () {
//                 quantity > 1
//                     ? context
//                         .read<CartBloc>()
//                         .add(CartEventDecrementQuantity(productId: productId))
//                     : null;
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildCustomButton(
//       {required IconData icon, required VoidCallback onTap}) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(2),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(4), color: AppColors.primary),
//         child: Icon(
//           icon,
//           color: Colors.white,
//           size: 24,
//         ),
//       ),
//     );
//   }
// }
