import 'package:e_coomerce_fruit/core/helper_functions/build_error_bar.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/main_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.selectedIndex,
    required List<Widget> pages,
  }) : pages = pages;

  final int selectedIndex;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          showBar(context, 'تمت العملية بنجاح');
        }
        if (state is CartItemRemoved) {
          showBar(context, 'تم حذف العنصر بنجاح');
        }
      },
      child: MainViewBody(selectedIndex: selectedIndex, pages: pages),
    );
  }
}
