import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/reviews_view_bloc_consumer.dart';
import 'package:flutter/material.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'المراجعه',
          style: TextStyles.bold19,
          textAlign: TextAlign.right,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ReviewsViewBlocConsumer(productId: productId),
    );
  }
}
