import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/order_summry_widget.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/shipping_addres_widget.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OrderSummryWidget(),
        SizedBox(height: 16),
        ShippingAddresWidget(pageController: pageController),
      ],
    );
  }
}
