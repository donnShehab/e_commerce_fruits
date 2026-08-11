import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/feature/best_selling_fruit/presntation/view/widget/best_selling_fruit_view_body.dart';
import 'package:flutter/material.dart';

class BestSellingFruitView extends StatelessWidget {
  const BestSellingFruitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الأكثر مبيعًا'),
      body: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: BestSellingFruitViewBody(),
      ),
    );
  }
}
