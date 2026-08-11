import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/cubit/products_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/products_grid_view_bloc+builder.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_header.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/featured_list.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/profile_home.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/search_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getBestSellingProducts();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bottom: false — الـ bottomNavigationBar في MainView يتكفل بالحافة السفلية
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: kHorizintalPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // كان 38 لتعويض شريط الحالة يدويًا — SafeArea يتكفل بذلك الآن
                  SizedBox(height: 16),
                  ProfileHome(),
                  SizedBox(height: 16),
                  SearchTextField(),
                  SizedBox(height: 12),
                  FeaturedList(),
                  SizedBox(height: 20),
                  BestSellingHeader(),
                  SizedBox(height: 8),
                ],
              ),
            ),
            ProductsGridViewBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
