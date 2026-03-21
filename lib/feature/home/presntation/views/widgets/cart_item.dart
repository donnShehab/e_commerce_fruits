// import 'dart:developer';

// import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
// import 'package:e_coomerce_fruit/core/utils/app_images.dart';
// import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
// import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_item_entity.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit_item/cart_item_cubit.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_item_action_buttons.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/fruit_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';

// class CartItem extends StatelessWidget {
//   const CartItem({super.key, required this.cartItemEntity});
//   final CartItemEntity cartItemEntity;
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartItemCubit, CartItemState>(
//       buildWhen: (prev, current) {
//         if (current is CartItemUpdate) {
//           if (current.cartItemEntity == cartItemEntity) {
//             return true;
//           }
//         }
//         return false;
//       },
//       builder: (context, state) {
//         log('we are bulding this widget');
//         return IntrinsicHeight(
//           child: Row(
//             children: [
//               Container(
//                 height: 92,
//                 width: 73,
//                 decoration: BoxDecoration(color: Color(0xFFF3F5F7)),
//                 child: CustomNetworkImage(
//                   imageUrl: cartItemEntity.productEntity.imageUrl!,
//                 ),
//               ),
//               SizedBox(width: 17),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           cartItemEntity.productEntity.name,
//                           style: TextStyles.bold13,
//                         ),
//                         Spacer(),

//                         GestureDetector(
//                           onTap: () {
//                             context.read<CartCubit>().deleteCartItem(
//                               cartItemEntity,
//                             );
//                           },
//                           child: SvgPicture.asset(Assets.imagesTrash),
//                         ),
//                       ],
//                     ),

//                     Text(
//                       '${cartItemEntity.calculateToWeight().toString()}  كم',
//                       style: TextStyles.regular13.copyWith(
//                         color: AppColors.secondryColor,
//                       ),
//                     ),
//                     SizedBox(height: 6),
//                     Row(
//                       children: [
//                         CartItemActionButtons(cartItemEntity: cartItemEntity),
//                         Spacer(),
//                         Text(
//                           '${cartItemEntity.calculateTotalPrice()} دنانير',
//                           style: TextStyles.bold16.copyWith(
//                             color: AppColors.secondryColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }


import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_item_entity.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit_item/cart_item_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_item_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (prev, current) {
        if (current is CartItemUpdate) {
          if (current.cartItemEntity == cartItemEntity) {
            return true;
          }
        }
        return false;
      },
      builder: (context, state) {
        log('we are building this widget');
        return IntrinsicHeight(
          child: Row(
            children: [
              // Product Image
              Container(
                height: 92,
                width: 73,
                decoration: const BoxDecoration(color: Color(0xFFF3F5F7)),
                child: cartItemEntity.productEntity.imageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: cartItemEntity.productEntity.imageUrl!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.image, color: Colors.white),
                      ),
              ),

              const SizedBox(width: 17),

              // Product details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: TextStyles.bold13,
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().deleteCartItem(
                              cartItemEntity,
                            );
                          },
                          child: SvgPicture.asset(Assets.imagesTrash),
                        ),
                      ],
                    ),
                    Text(
                      '${cartItemEntity.calculateToWeight().toString()}  كم',
                      style: TextStyles.regular13.copyWith(
                        color: AppColors.secondryColor,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        CartItemActionButtons(cartItemEntity: cartItemEntity),
                        const Spacer(),
                        Text(
                          '${cartItemEntity.calculateTotalPrice()} دنانير',
                          style: TextStyles.bold16.copyWith(
                            color: AppColors.secondryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
