import 'package:e_coomerce_fruit/feature/on_boarding/presntation/view/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const SafeArea(child: OnBoardingViewBody()));
  }
}
