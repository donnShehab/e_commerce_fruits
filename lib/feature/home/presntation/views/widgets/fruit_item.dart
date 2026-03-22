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
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEEEEEE), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  // TODO: handle favorite toggle
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.favorite_border_rounded,
                    color: AppColors.primaryColor,
                    size: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: productEntity.imageUrl != null
                    ? CachedNetworkImage(
                        imageUrl: productEntity.imageUrl!,
                        fit: BoxFit.contain,
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Icon(Icons.image, color: Colors.white),
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              productEntity.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold16.copyWith(
                color: const Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    context.read<CartCubit>().addProduct(productEntity);
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.add, size: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${productEntity.price} دينار',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' / كيلو',
                          style: TextStyles.semiBold13.copyWith(
                            color: const Color(0xFF9AA1A1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
