// // import 'package:e_coomerce_fruit/constants.dart';
// // import 'package:e_coomerce_fruit/core/cubit/products_cubit.dart';
// // import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_grid_view.dart';
// // import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/products_grid_view_bloc+builder.dart';
// // import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_header.dart';
// // import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/featured_list.dart';
// // import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/profile_home.dart';
// // import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/search_home.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';

// // class HomeViewBody extends StatefulWidget {
// //   const HomeViewBody({super.key});

// //   @override
// //   State<HomeViewBody> createState() => _HomeViewBodyState();
// // }

// // class _HomeViewBodyState extends State<HomeViewBody> {
// //   @override
// //   void initState() {
// //     context.read<ProductsCubit>().getBestSellingProducts();
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: EdgeInsetsGeometry.symmetric(horizontal: kHorizintalPadding),
// //       child: CustomScrollView(
// //           slivers: [

// //           SliverToBoxAdapter(
// //             child: Column(
// //               children: [
// //                 SizedBox(height: 38),
// //                 ProfileHome(),
// //                 SizedBox(height: 16),
// //                 SearchTextField(),
// //                 SizedBox(height: 12),
// //                 FeaturedList(),
// //                 SizedBox(height: 20),
// //                 BestSellingHeader(),
// //                 SizedBox(height: 8),
// //               ],
// //             ),
// //           ),

// //           ProductsGridViewBlocBuilder(),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // 2 BLCK BOX
// import 'package:e_coomerce_fruit/constants.dart';
// import 'package:e_coomerce_fruit/core/cubit/products_cubit.dart';
// import 'package:e_coomerce_fruit/core/helper_functions/get_dummy_product.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_grid_view.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_header.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/custom_err_message.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/featured_list.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/profile_home.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/search_home.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:skeletonizer/skeletonizer.dart'; // Ensure this is imported for Skeletonizer.sliver

// class HomeViewBody extends StatefulWidget {
//   const HomeViewBody({super.key});

//   @override
//   State<HomeViewBody> createState() => _HomeViewBodyState();
// }

// class _HomeViewBodyState extends State<HomeViewBody> {
//   @override
//   void initState() {
//     context
//         .read<ProductsCubit>()
//         .getBestSellingProducts(); // Keep this for initial load
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
//       child: BlocBuilder<ProductsCubit, ProductsState>(
//         // Wrap CustomScrollView with BlocBuilder
//         builder: (context, state) {
//           // Build slivers dynamically based on state
//           List<Widget> slivers = [
//             SizedBox(height: 10,),
//             SliverToBoxAdapter(

//               child: Column(
//                 children: [
//                   SizedBox(height: 52),
//                   ProfileHome(),
//                   SizedBox(height: 16),
//                   SearchTextField(),
//                   SizedBox(height: 12),
//                   FeaturedList(),
//                   SizedBox(height: 20),
//                   BestSellingHeader(),
//                   SizedBox(height: 8),
//                 ],
//               ),
//             ),
//           ];

//           // Add dynamic sliver based on state
//           if (state is ProductsSuccess) {
//             slivers.add(ProductsGridView(products: state.products));
//           } else if (state is ProductsFailuer) {
//             slivers.add(
//               SliverToBoxAdapter(
//                 child: CustomErrMessage(text: state.errMessage),
//               ),
//             );
//           } else {
//             // Loading state with Skeletonizer
//             slivers.add(
//               Skeletonizer.sliver(
//                 enabled: true,
//                 child: ProductsGridView(products: getDummyProducts()),
//               ),
//             );
//           }

//           return CustomScrollView(slivers: slivers);
//         },
//       ),
//     );
//   }
// }
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
      padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          List<Widget> slivers = [
            // Spacing at top
            SliverToBoxAdapter(child: SizedBox(height: 10)),

            // Profile, search, featured list, header
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 52),
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
          ];

          // --- PRODUCTS LOADING/SUCCESS/FAILURE ---

          if (state is ProductsSuccess) {
            // NOTE: ProductsGridView MUST return a SliverGrid
            slivers.add(ProductsGridView(products: state.products));
          } else if (state is ProductsFailuer) {
            slivers.add(
              SliverToBoxAdapter(
                child: CustomErrMessage(text: state.errMessage),
              ),
            );
          } else {
            // Loading state using Skeletonizer
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
