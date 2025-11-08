// import 'package:e_coomerce_fruit/constants.dart';
// import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
// import 'package:e_coomerce_fruit/core/utils/app_images.dart';
// import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
// import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
// import 'package:e_coomerce_fruit/core/widgets/custom_button.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit_item/cart_item_cubit.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_header.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_item.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_item_list.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/custom_cart_button.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/custom_divider.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/empty_cart_Animation_widget.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/fruit_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';

// class CartViewBody extends StatelessWidget {
//   const CartViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: Column(
//                 children: [
//                   SizedBox(height: kTopPadding),
//                   buildAppBar(context, title: 'السلة', showNotification: false),
//                   SizedBox(height: 18),
//                   CartHeader(),
//                   const SizedBox(height: 12),
//                 ],
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: context.watch<CartCubit>().cartEntity.cartItems.isEmpty
//                   ? SizedBox()
//                   : CustomDivider(),
//             ),
//             // CartItemList(cartItems: []),
//             if (context.watch<CartCubit>().cartEntity.cartItems.isEmpty)
//               const SliverToBoxAdapter(
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 100),
//                   child: EmptyCartAnimationWidget(),
//                 ),
//               )
//             else
//               CartItemList(
//                 cartItems: context.watch<CartCubit>().cartEntity.cartItems,
//               ),

//             SliverToBoxAdapter(
//               child: context.watch<CartCubit>().cartEntity.cartItems.isEmpty
//                   ? SizedBox()
//                   : CustomDivider(),
//             ),
//           ],
//         ),
//         Positioned(
//           right: 16,
//           left: 16,
//           bottom: MediaQuery.sizeOf(context).height * .06,
//           child: CustomCartButton(),
//         ),
//       ],
//     );
//   }
// }

// import 'package:e_coomerce_fruit/constants.dart';
// import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
// import 'package:e_coomerce_fruit/core/utils/app_images.dart';
// import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
// import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
// import 'package:e_coomerce_fruit/core/widgets/custom_button.dart';
// import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_item_entity.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit_item/cart_item_cubit.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_header.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_item.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_item_list.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/custom_cart_button.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/custom_divider.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/empty_cart_Animation_widget.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/fruit_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';

// class CartViewBody extends StatelessWidget {
//   const CartViewBody({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         CustomScrollView(
//           slivers: [
//             SliverToBoxAdapter(
//               child: Column(
//                 children: [
//                   SizedBox(height: kTopPadding),
//                   buildAppBar(context, title: 'السلة', showNotification: false),
//                   SizedBox(height: 18),
//                   CartHeader(),
//                   const SizedBox(height: 12),
//                 ],
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
//                   ? SizedBox()
//                   : CustomDivider(),
//             ), // CartItemList(cartItems: []),
//             if (context.read<CartCubit>().cartEntity.cartItems.isEmpty)
//               const SliverToBoxAdapter(
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 100),
//                   child: EmptyCartAnimationWidget(),
//                 ),
//               )
//             else
//               CartItemList(
//                 cartItems: context.watch<CartCubit>().cartEntity.cartItems,
//               ),
//             SliverToBoxAdapter(
//               child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
//                   ? SizedBox()
//                   : CustomDivider(),
//             ),
//           ],
//         ),
//         Positioned(
//           right: 16,
//           left: 16,
//           bottom: MediaQuery.sizeOf(context).height * .06,
//           child: CustomCartButton(),
//         ),
//       ],
//     );
//   }
// }

// class CartItemActionCircual extends StatelessWidget {
//   const CartItemActionCircual({
//     super.key,
//     required this.icon,
//     required this.onPressed,
//     required this.color,
//     required this.iconColor,
//   });
//   final IconData icon;
//   final VoidCallback onPressed;
//   final Color color;
//   final Color iconColor;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: 24,
//         height: 24,
//         padding: EdgeInsets.all(2),
//         decoration: ShapeDecoration(
//           color: color,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadiusGeometry.circular(100),
//           ),
//         ),
//         child: FittedBox(child: Icon(icon, color: iconColor)),
//       ),
//     );
//   }
// }

// // methods calculate
import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_header.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_item_list.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/custom_cart_button.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/custom_divider.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/empty_cart_Animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>(); // ✅ استخدم watch

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: kTopPadding),
                  buildAppBar(context, title: 'السلة', showNotification: false),
                  SizedBox(height: 18),
                  CartHeader(),
                  const SizedBox(height: 12),
                ],
              ),
            ),

            SliverToBoxAdapter(
              child: cartCubit.cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            ),

            // ✅ استمع للحالة وتحدث تلقائيًا
            if (cartCubit.cartEntity.cartItems.isEmpty)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: EmptyCartAnimationWidget(),
                ),
              )
            else
              CartItemList(cartItems: cartCubit.cartEntity.cartItems),

            SliverToBoxAdapter(
              child: cartCubit.cartEntity.cartItems.isEmpty
                  ? const SizedBox()
                  : const CustomDivider(),
            ),
          ],
        ),

        Positioned(
          right: 16,
          left: 16,
          bottom: MediaQuery.sizeOf(context).height * .06,
          child: const CustomCartButton(),
        ),
      ],
    );
  }
}

class CartItemActionCircual extends StatelessWidget {
  const CartItemActionCircual({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.color,
    required this.iconColor,
  });
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        padding: EdgeInsets.all(2),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(100),
          ),
        ),
        child: FittedBox(child: Icon(icon, color: iconColor)),
      ),
    );
  }
}
