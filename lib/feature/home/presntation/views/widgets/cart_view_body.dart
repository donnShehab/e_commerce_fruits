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
                  padding: EdgeInsets.only(top: 70),
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
          bottom: MediaQuery.sizeOf(context).height * 09 / 68,
          child: const CustomCartButton(),
        ),
      ],
    );
  }
}
