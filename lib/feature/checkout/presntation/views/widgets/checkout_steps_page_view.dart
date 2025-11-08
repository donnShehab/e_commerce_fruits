import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/addres_input_section.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/payment_section.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/shipping_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kVerticalPadding),
      child: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: getPages().length,
        itemBuilder: (context, index) {
          return getPages()[index];
        },
      ),
    );
  }

  List getPages() {
    return [
      ShippingSection(),
      AddresInputSection(formKey: formKey, valueListenable: valueListenable),
      PaymentSection(pageController: pageController),
    ];
  }
}
