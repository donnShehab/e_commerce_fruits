import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/active_item_step.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/in_active_item_step.dart';
import 'package:flutter/material.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.text,
    required this.index,
    required this.isActive,
  });
  final String text, index;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: InActiveItemStep(index: index, text: text),
      secondChild: ActiveItemStep(text: text),
      crossFadeState: isActive
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: Duration(microseconds: 300),
    );
  }
}
