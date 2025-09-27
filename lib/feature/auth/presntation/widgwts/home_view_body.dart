import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/feature/auth/presntation/widgwts/best_seller_home.dart';
import 'package:fruit_hub/feature/auth/presntation/widgwts/offers_home.dart';
import 'package:fruit_hub/feature/auth/presntation/widgwts/profile_home.dart';
import 'package:fruit_hub/feature/auth/presntation/widgwts/search_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeViewBody());
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: kHorizintalPadding),
        child: Column(
          children: [
            SizedBox(height: 38),
            ProfileHome(),
            SizedBox(height: 16),
            SearchHome(),
            SizedBox(height: 12),
            OffersHome(),
            SizedBox(height: 20),
            BestSellerHome(),
          ],
        ),
      ),
    );
  }
}
