import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/feature/best_selling_fruit/presntation/view/widget/best_selling_fruit_view_body.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';
import 'package:fruit_hub/core/widgets/custom_notification.dart';

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
      body: BestSellingFruitViewBody(
        
      ),
    );
  }
}
