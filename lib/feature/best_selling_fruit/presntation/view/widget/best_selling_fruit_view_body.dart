import 'package:e_coomerce_fruit/core/helper_functions/get_dummy_product.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_grid_view.dart';
import 'package:flutter/material.dart';

class BestSellingFruitViewBody extends StatelessWidget {
  const BestSellingFruitViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(),
          ProductsGridView(products: getDummyProducts()),
        ],
      ),
    );
  }
}
