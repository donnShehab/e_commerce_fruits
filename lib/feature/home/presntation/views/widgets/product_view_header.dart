import 'package:e_coomerce_fruit/core/cubit/products_cubit.dart';
import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// class ProductViewHeader extends StatefulWidget {
//   const ProductViewHeader({super.key, required this.productsLength});
//   final int productsLength;

//   @override
//   State<ProductViewHeader> createState() => _ProductViewHeaderState();
// }

// class _ProductViewHeaderState extends State<ProductViewHeader> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 2),
//       child: Row(
//         children: [
//           Text('${widget.productsLength} نتائج', style: TextStyles.bold16),
//           const Spacer(),
//           GestureDetector(
//             onTap: () {
//               GoRouter.of(context).push(AppRouter.kHomeView);
//             },
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: ShapeDecoration(
//                 color: Colors.white.withOpacity(0.10000000149011612),
//                 shape: RoundedRectangleBorder(
//                   side: const BorderSide(width: 1, color: Color(0x66CACECE)),
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ),
//               child: Icon(Icons.swap_vert, color: Colors.grey),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:e_coomerce_fruit/feature/home/home_product.dart/presntation/cubit/products_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ProductViewHeader extends StatelessWidget {
//   const ProductViewHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProductsCubit, ProductsState>(
//       builder: (context, state) {
// if (state is ProductsLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (state is ProductsFailuer) {
//           return Center(child: Text('حدث خطأ: ${state.errMessage}'));
//         } else if (state is ProductsSuccess) {
//           // ✅ هنا نقدر نستخدم state.products
//           final productsLength = state.products.length;
//           return Text('$productsLength نتائج');
//         } else {
//           // الحالة الابتدائية
//         }        return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 2),
//           child: Row(
//             children: [
//               Text('$pro نتائج', style: TextStyles.bold16),
//               const Spacer(),
//               GestureDetector(
//                 onTap: () {
//                   GoRouter.of(context).push(AppRouter.kHomeView);
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 8,
//                   ),
//                   decoration: ShapeDecoration(
//                     color: Colors.white.withOpacity(0.1),
//                     shape: RoundedRectangleBorder(
//                       side: const BorderSide(
//                         width: 1,
//                         color: Color(0x66CACECE),
//                       ),
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                   ),
//                   child: const Icon(Icons.swap_vert, color: Colors.grey),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        int productsLength = 0;

        if (state is ProductsSuccess) {
          productsLength = state.products.length;
        } else if (state is ProductsFailuer) {
          productsLength = 0;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Row(
            children: [
              Text('$productsLength نتائج', style: TextStyles.bold16),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kHomeView);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1,
                        color: Color(0x66CACECE),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Icon(Icons.swap_vert, color: Colors.grey),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
