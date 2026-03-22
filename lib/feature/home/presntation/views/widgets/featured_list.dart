import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/featured_item.dart';
import 'package:flutter/material.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredImages = [
      Assets.imagesAlwadFeaturedItemOne,
      Assets.imagesBurgerAlwadiGO1,
      Assets.imagesBurgerAlwadiGO2,
    ];

    return SizedBox(
      height: 210,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.92),
        itemCount: featuredImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: FeaturedItem(
              imagePath: featuredImages[index],
              title: index == 0 ? 'عروض خاصة' : 'وجبات مميزة',
              subtitle: index == 0 ? 'خصم حتى 25%' : 'اطلب الآن واستمتع',
            ),
          );
        },
      ),
    );
  }
}