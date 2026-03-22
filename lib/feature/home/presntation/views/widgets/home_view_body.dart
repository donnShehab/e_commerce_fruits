import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/cubit/products_cubit.dart';
import 'package:e_coomerce_fruit/core/helper_functions/get_dummy_product.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_grid_view.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_header.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/custom_err_message.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/featured_list.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/profile_home.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/search_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getBestSellingProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          List<Widget> slivers = [
            const SliverToBoxAdapter(child: SizedBox(height: 32)),
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  ProfileHome(),
                  SizedBox(height: 18),
                  SearchTextField(),
                  SizedBox(height: 16),
                  FeaturedList(),
                  SizedBox(height: 24),
                  BestSellingHeader(),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ];

          if (state is ProductsSuccess) {
            slivers.add(ProductsGridView(products: state.products));
          } else if (state is ProductsFailuer) {
            slivers.add(
              SliverToBoxAdapter(
                child: CustomErrMessage(text: state.errMessage),
              ),
            );
          } else {
            slivers.add(
              Skeletonizer.sliver(
                enabled: true,
                child: ProductsGridView(products: getDummyProducts()),
              ),
            );
          }

          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: slivers,
          );
        },
      ),
    );
  }
}
