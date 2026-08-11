import 'package:e_coomerce_fruit/core/widgets/custom_app_bar.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit_item/cart_item_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_view_body.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/custom_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'السلة', showNotification: false),
        body: CartViewBody(),
        // يجلس فوق شريط التنقل بدل أن يطفو فوق آخر عنصر في القائمة
        bottomNavigationBar: const CustomCartButton(),
      ),
    );
  }
}
