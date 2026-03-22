import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/fruit_item.dart';

class ProductsGridView extends StatelessWidget {
  final List<ProductEntity> products;

  const ProductsGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      // Add padding around the grid
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
      sliver: SliverGrid.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.70,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: () {
              // Navigate to product details
              GoRouter.of(
                context,
              ).push(AppRouter.kProductViewDetails, extra: product);
            },
            child: FruitItem(productEntity: product),
          );
        },
      ),
    );
  }
}
