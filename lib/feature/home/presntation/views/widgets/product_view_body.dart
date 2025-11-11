// import 'package:e_coomerce_fruit/constants.dart';
// import 'package:e_coomerce_fruit/core/cubit/products_cubit.dart';
// import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
// import 'package:e_coomerce_fruit/core/utils/app_images.dart';
// import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
// import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
// import 'package:e_coomerce_fruit/core/widgets/custom_notification.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/product_view_header.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/products_grid_view_bloc+builder.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_header.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/featured_list.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/profile_home.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/search_home.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';

// class ProductViewBody extends StatefulWidget {
//   const ProductViewBody({super.key});

//   @override
//   State<ProductViewBody> createState() => _ProductViewBodyState();
// }

// class _ProductViewBodyState extends State<ProductViewBody> {
//   @override
//   void initState() {
//     // context.read<ProductsCubit>().getBestSellingProducts();
//     context.read<ProductsCubit>().getProducts();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: buildAppBar(context, title: 'المنتجات'),
//       body: Padding(
//         padding: EdgeInsetsGeometry.symmetric(horizontal: kHorizintalPadding),
//         child: CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   buildAppBar(
//                     context,
//                     title: 'المنتجات',
//                     showBackButton: false,
//                   ),
//                   const SizedBox(height: 16),
//                   SearchTextField(),

//                   SizedBox(height: 16),
//                   ProductViewHeader(
//                     // productsLengcontext
//                     //     .read<ProductsCubit>()
//                     //     .productsLength,
//                   ),
//                   SizedBox(height: 16),
//                 ],
//               ),
//             ),
//             ProductsGridViewBlocBuilder(),
//           ],
//         ),
//       ),
//     );
//   }
// }


// 2 black box

import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/cubit/products_cubit.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/helper_functions/get_dummy_product.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_grid_view.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/custom_err_message.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/product_view_header.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/products_grid_view_bloc+builder.dart'; // Can remove if inlining
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/search_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  void initState() {
    context.read<ProductsCubit>().getProducts(); // Keep for initial load
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          // Wrap CustomScrollView with BlocBuilder
          builder: (context, state) {
            List<Widget> slivers = [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    buildAppBar(
                      context,
                      title: 'المنتجات',
                      showBackButton: false,
                    ),
                    const SizedBox(height: 16),
                    SearchTextField(),
                    SizedBox(height: 16),
                    ProductViewHeader(),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ];

            // Add dynamic sliver based on state
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

            return CustomScrollView(slivers: slivers);
          },
        ),
      ),
    );
  }
}
