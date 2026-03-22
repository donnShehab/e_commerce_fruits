import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/cubit/products_cubit.dart';
import 'package:e_coomerce_fruit/core/helper_functions/get_dummy_product.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_grid_view.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/custom_err_message.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/product_view_header.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/search_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            final List<Widget> slivers = [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    buildAppBar(
                      context,
                      title: 'المنتجات',
                      showBackButton: false,
                    ),
                    const SizedBox(height: 18),
                    const SearchTextField(),
                    const SizedBox(height: 18),
                    const ProductViewHeader(),
                    const SizedBox(height: 14),
                  ],
                ),
              ),
            ];

            if (state is ProductsSuccess) {
              slivers.add(ProductsGridView(products: state.products));
            } else if (state is ProductsFailuer) {
              slivers.add(
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: CustomErrMessage(text: state.errMessage),
                  ),
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
      ),
    );
  }
}
