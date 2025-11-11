// import 'package:e_coomerce_fruit/core/utils/app_images.dart';
// import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/cubits/search_cubit/search_cubit_cubit.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/cubits/search_cubit/search_cubit_state.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_grid_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';

// class SearchViewBody extends StatefulWidget {
//   const SearchViewBody({super.key});

//   @override
//   State<SearchViewBody> createState() => _SearchViewBodyState();
// }

// class _SearchViewBodyState extends State<SearchViewBody> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     context.read<SearchCubit>().loadSearchData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: BlocBuilder<SearchCubit, SearchState>(
//         builder: (context, state) {
//           if (state is SearchLoading) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (state is SearchFailure) {
//             return Center(child: Text(state.errMessage));
//           } else if (state is SearchLoaded) {
//             return CustomScrollView(
//               slivers: [
//                 SliverToBoxAdapter(
//                   child: Column(
//                     children: [
//                       // Search Field
//                       TextField(
//                         controller: _controller,
//                         onChanged: (value) =>
//                             context.read<SearchCubit>().searchProducts(value),
//                         decoration: InputDecoration(
//                           hintText: 'ابحث عن منتج...cd path/to/your/project',
//                           prefixIcon: Icon(Icons.search),
//                           suffixIcon: IconButton(
//                             icon: Icon(Icons.clear),
//                             onPressed: () {
//                               _controller.clear();
//                               context.read<SearchCubit>().searchProducts('');
//                             },
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       // Recent Searches
//                       if (state.recentSearches.isNotEmpty)
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'عمليات البحث الأخيرة',
//                                   style: TextStyles.bold16,
//                                 ),
//                                 TextButton(
//                                   onPressed: () => context
//                                       .read<SearchCubit>()
//                                       .clearRecentSearches(),
//                                   child: Text('مسح الكل'),
//                                 ),
//                               ],
//                             ),
//                             Wrap(
//                               children: state.recentSearches
//                                   .map((search) => Chip(label: Text(search)))
//                                   .toList(),
//                             ),
//                           ],
//                         ),
//                       const SizedBox(height: 16),
//                       // Results
//                       Expanded(
//                         child: state.products.isEmpty
//                             ? Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SvgPicture.asset(
//                                       Assets.imagesIllustrations,
//                                       height: 100,
//                                     ), // Add this icon to Assets
//                                     const SizedBox(height: 16),
//                                     Text(
//                                       'المنتج غير متوفر',
//                                       style: TextStyles.regular16,
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             : ProductsGridView(
//                                 products: state.products,
//                               ), // Reuse your grid
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           }
//           return const SizedBox();
//         },
//       ),
//     );
//   }
// }

// box 2

import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/search_cubit/search_cubit_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/search_cubit/search_cubit_state.dart'; // Ensure this is imported
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().loadSearchData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          List<Widget> slivers = [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // Search Field
                  TextField(
                    controller: _controller,
                    onChanged: (value) =>
                        context.read<SearchCubit>().searchProducts(value),
                    decoration: InputDecoration(
                      hintText: 'ابحث عن منتج...',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          context.read<SearchCubit>().searchProducts('');
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Recent Searches (with type check)
                  if (state is SearchLoaded &&
                      state
                          .recentSearches
                          .isNotEmpty) // Fixed: Added 'state is SearchLoaded'
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'عمليات البحث الأخيرة',
                              style: TextStyles.bold16,
                            ),
                            TextButton(
                              onPressed: () => context
                                  .read<SearchCubit>()
                                  .clearRecentSearches(),
                              child: Text('مسح الكل'),
                            ),
                          ],
                        ),
                        Wrap(
                          children: state.recentSearches
                              .map((search) => Chip(label: Text(search)))
                              .toList(),
                        ),
                      ],
                    ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ];

          // Add results sliver based on state
          if (state is SearchLoading) {
            slivers.add(
              SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (state is SearchFailure) {
            slivers.add(
              SliverToBoxAdapter(child: Center(child: Text(state.errMessage))),
            );
          } else if (state is SearchLoaded) {

            if (state.products.isEmpty) {
              slivers.add(
                SliverToBoxAdapter(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Image.asset(
                          Assets.imagesIllustrations,
                          height: 100,
                        ), // Fixed: Use Image.asset for PNG

                        const SizedBox(height: 16),

                        Text('المنتج غير متوفر', style: TextStyles.regular16),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              slivers.add(ProductsGridView(products: state.products));
            }
            // if (state.products.isEmpty) {
            //   slivers.add(
            //     SliverToBoxAdapter(
            //       child: Center(
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             SvgPicture.asset(
            //               Assets.imagesIllustrations,
            //               height: 100,
            //             ),
            //             const SizedBox(height: 16),
            //             Text('المنتج غير متوفر', style: TextStyles.regular16),
            //           ],
            //         ),
            //       ),
            //     ),
            //   );
            // } else {
            //   slivers.add(ProductsGridView(products: state.products));
            // }
          }

          return CustomScrollView(slivers: slivers);
        },
      ),
    );
  }
}
