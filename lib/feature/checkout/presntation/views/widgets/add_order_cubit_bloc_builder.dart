import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/helper_functions/build_error_bar.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_progress_hud.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/add_order_cubit/add_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          GoRouter.of(context).go(AppRouter.kPaypalCheckoutSuccessView);
        }

        if (state is AddOrderFauiler) {
          showBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddOrderLoading,
          child: child,
        );
      },
    );
  }
}
