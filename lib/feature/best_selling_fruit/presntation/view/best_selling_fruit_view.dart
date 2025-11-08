import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_notification.dart';
import 'package:e_coomerce_fruit/feature/best_selling_fruit/presntation/view/widget/best_selling_fruit_view_body.dart';
import 'package:flutter/material.dart';

class BestSellingFruitView extends StatelessWidget {
  const BestSellingFruitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الأكثر مبيعًا", style: TextStyles.bold19),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
        actions: const [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: kHorizintalPadding,
            ),
            child: CustomNofitication(),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: BestSellingFruitViewBody(),
      ),
    );
  }
}
