import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/home/presntation/views/widgets/best_selling_grid_view.dart';

class BestSellingFruitViewBody extends StatelessWidget {
  const BestSellingFruitViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [SliverToBoxAdapter()
          , BestSellingGridView()],
      ),
    );
  }
}
