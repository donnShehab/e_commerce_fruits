import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/home/presntation/views/widgets/home_view_body.dart';
import 'package:fruit_hub/feature/home/presntation/views/widgets/custom_bottom_navigation.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigation(),
      body: HomeViewBody(),
    );
  }
}
