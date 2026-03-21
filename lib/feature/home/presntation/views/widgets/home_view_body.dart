import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/feature/home/presntation/views/widgets/best_selling_grid_view.dart';
import 'package:fruit_hub/feature/home/presntation/views/widgets/best_selling_header.dart';
import 'package:fruit_hub/feature/home/presntation/views/widgets/featured_list.dart';
import 'package:fruit_hub/feature/home/presntation/views/widgets/profile_home.dart';
import 'package:fruit_hub/feature/home/presntation/views/widgets/search_home.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: kHorizintalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 38),
                ProfileHome(),
                SizedBox(height: 16),
                SearchHome(),
                SizedBox(height: 12),
                FeaturedList(),
                SizedBox(height: 20),
                BestSellingHeader(),
                SizedBox(height: 8),
              ],
            ),
          ),
          BestSellingGridView(),
        ],
      ),
    );
  }
}
