// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
// import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
// import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
// import 'package:e_coomerce_fruit/core/utils/app_images.dart';
// import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// class FruitItem extends StatelessWidget {
//   const FruitItem({super.key, required this.productEntity});
//   final ProductEntity productEntity;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // width: 163,
//       // height: 250,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4),
//         color: const Color(0xffF3F5F7),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             top: -1,
//             right: -3,
//             child: IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.favorite_outline),
//             ),
//           ),
//           Positioned.fill(
//             child: Column(
//               children: [
//                 const SizedBox(height: 20),
//                 productEntity.imageUrl != null
//                     ? Flexible(
//                         child: CachedNetworkImage(
//                           imageUrl: productEntity.imageUrl!,
//                         ),
//                       )
//                     : Container(color: Colors.grey, height: 100, width: 100),

//                 const SizedBox(height: 24),

//                 ListTile(
//                   title: Text(
//                     productEntity.name,
//                     textAlign: TextAlign.right,
//                     style: TextStyles.semiBold16,
//                     maxLines: 1,
//                   ),
//                   subtitle: Text.rich(
//                     TextSpan(
//                       children: [
//                         TextSpan(
//                           text: '${productEntity.price}دينار',
//                           style: TextStyles.bold13.copyWith(
//                             color: AppColors.secondryColor,
//                           ),
//                         ),
//                         TextSpan(
//                           text: '/',
//                           style: TextStyles.bold13.copyWith(
//                             color: AppColors.lightSecondryColor,
//                           ),
//                         ),
//                         TextSpan(
//                           text: ' ',
//                           style: TextStyles.bold13.copyWith(),
//                         ),
//                         TextSpan(
//                           text: 'كيلو',
//                           style: TextStyles.bold13.copyWith(
//                             color: AppColors.lightSecondryColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   trailing: GestureDetector(
//                     onTap: () {
//                       context.read<CartCubit>().addProduct(productEntity);
//                     },
//                     child: CircleAvatar(
//                       backgroundColor: AppColors.primaryColor,
//                       child: Icon(Icons.add, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomNetworkImage extends StatelessWidget {
//   const CustomNetworkImage({super.key, required this.imageUrl});

//   final String imageUrl;

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(imageUrl);
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FruitItem extends StatelessWidget {
  final ProductEntity productEntity;

  const FruitItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xffF3F5F7),
      ),
      child: Stack(
        children: [
          // Favorite button
          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                // TODO: handle favorite toggle
              },
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(Icons.favorite_outline, color: Colors.red),
              ),
            ),
          ),

          // Main content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize:
                  MainAxisSize.min, // Important to avoid infinite height
              children: [
                // Product Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: productEntity.imageUrl != null
                      ? CachedNetworkImage(
                          imageUrl: productEntity.imageUrl!,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        )
                      : Container(
                          height: 120,
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: const Icon(Icons.image, color: Colors.white),
                        ),
                ),

                const SizedBox(height: 12),

                // Product name and price
                Text(
                  productEntity.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.semiBold16,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '${productEntity.price} دينار',
                      style: TextStyles.bold13.copyWith(
                        color: AppColors.secondryColor,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '/ كيلو',
                      style: TextStyles.bold13.copyWith(
                        color: AppColors.lightSecondryColor,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        context.read<CartCubit>().addProduct(productEntity);
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.primaryColor,
                        child: const Icon(
                          Icons.add,
                          size: 18,
                          color: Colors.white,
                        ),
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
  }
}
