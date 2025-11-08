// import 'package:e_coomerce_fruit/feature/home/home_main/presntation/cubits/cart_cubit/cart_cubit.dart';
// import 'package:e_coomerce_fruit/feature/home/home_main/presntation/views/widgets/cart_view_body.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CartView extends StatelessWidget {
//   const CartView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartCubit, CartState>(
//       builder: (context, state) {
//         return CartViewBody();
//       },
//     );
//   }
// }
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit_item/cart_item_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(),
      child: CartViewBody(),
    );
  }
}
