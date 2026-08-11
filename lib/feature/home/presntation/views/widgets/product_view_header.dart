import 'package:e_coomerce_fruit/core/cubit/products_cubit.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        int productsLength = 0;

        if (state is ProductsSuccess) {
          productsLength = state.products.length;
        } else if (state is ProductsFailuer) {
          productsLength = 0;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            children: [
              Text('$productsLength نتائج', style: TextStyles.bold16),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kHomeView);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        color: Color(0x66CACECE),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Icon(Icons.swap_vert, color: Colors.grey),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
