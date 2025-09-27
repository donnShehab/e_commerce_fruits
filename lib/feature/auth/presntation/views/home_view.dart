import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/auth/presntation/widgwts/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
    );
  }
}