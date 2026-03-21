import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/home/presntation/views/widgets/fruit_item.dart';
import 'package:fruit_hub/core/utils/app_images.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) =>
          FruitItem(imagePath: Assets.imagesWatermelon),
    );
  }
}
