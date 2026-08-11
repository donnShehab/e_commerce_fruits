import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/cubit/products_cubit.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/product_view_header.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/products_grid_view_bloc+builder.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/search_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  void initState() {
    // context.read<ProductsCubit>().getBestSellingProducts();
    context.read<ProductsCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'المنتجات', showBackButton: false),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: kHorizintalPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  SearchTextField(),

                  SizedBox(height: 16),
                  ProductViewHeader(
                    // productsLengcontext
                    //     .read<ProductsCubit>()
                    //     .productsLength,
                  ),
                  SizedBox(height: 16),
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
