import 'package:e_coomerce_fruit/core/cubit/products_cubit.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        int productsLength = 0;

        if (state is ProductsSuccess) {
          productsLength = state.products.length;
        }

        return Row(
          children: [
            Container(
              width: 56,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE8E2DA), width: 1),
              ),
              child: const Icon(
                Icons.swap_vert_rounded,
                color: Color(0xFF9B9B9B),
                size: 22,
              ),
            ),
            const Spacer(),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$productsLength ',
                    style: TextStyles.bold19.copyWith(
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                  TextSpan(
                    text: 'نتائج',
                    style: TextStyles.semiBold16.copyWith(
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
