import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 163,
      // height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffF3F5F7),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -1,
            right: -3,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20),
                productEntity.imageUrl != null
                    ? Flexible(
                        child: CustomNetworkImage(
                          imageUrl: productEntity.imageUrl!,
                        ),
                      )
                    : Container(color: Colors.grey, height: 100, width: 100),

                const SizedBox(height: 24),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
                //   child: Align(
                //     alignment: Alignment.centerRight,
                //     child: Text(
                //       name,
                //       style: TextStyles.semiBold13.copyWith(
                //         color: Colors.black,
                //         fontWeight: FontWeight.w700,
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 4),
                // Row(
                //   children: [
                //     Text(
                //       price,
                //       style: TextStyles.bold13.copyWith(
                //         color: AppColors.secondryColor,
                //       ),
                //     ),
                //     Text(
                //       unit,
                //       style: TextStyles.semiBold13.copyWith(
                //         color: AppColors.lightSecondryColor,
                //       ),
                //     ),
                //     const Spacer(),
                //     AddProductButton(
                //       onAdd: () {
                //         GoRouter.of(context).push(AppRouter.kAddingProductView);
                //       },
                //     ),
                //   ],
                // ),
                ListTile(
                  title: Text(
                    productEntity.name,
                    textAlign: TextAlign.right,
                    style: TextStyles.semiBold16,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${productEntity.price}دينار',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.secondryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.lightSecondryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyles.bold13.copyWith(),
                        ),
                        TextSpan(
                          text: 'كيلو',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.lightSecondryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      context.read<CartCubit>().addProduct(productEntity);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl);
  }
}
