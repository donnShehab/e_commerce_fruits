import 'package:e_coomerce_fruit/core/helper_functions/build_error_bar.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/order_input_entity.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/active_item_step.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/step_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentPageIndex,
    required this.pageController,
    required this.onTap,
  });
  final int currentPageIndex;
  final PageController pageController;
  final ValueChanged<int> onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if ((context.read<OrderInputEntity>().payWithCash != null)) {
                pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else {
                showBar(context, 'يرجى تحديد طريقة الدفع');
              }
            },
            child: StepItem(
              isActive: index <= currentPageIndex,
              index: (index + 1).toString(),
              text: getSteps()[index],
            ),
          ),
        );
      }),
    );
  }
}

List<String> getSteps() {
  return ['العنوان', 'الدفع', 'المراجعه'];
}
