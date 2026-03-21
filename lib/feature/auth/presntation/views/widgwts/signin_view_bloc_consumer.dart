import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/helper_functions/app_router.dart';
import 'package:fruit_hub/feature/auth/presntation/cubits/signin_cubits/signin_cubit.dart';
import 'package:fruit_hub/feature/auth/presntation/views/widgwts/sigin_view_body.dart';
import 'package:fruit_hub/core/widgets/custom_progress_hud.dart';

import 'package:go_router/go_router.dart';

class SigninViewBlocConsumer extends StatelessWidget {
  const SigninViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          // Navigate to the home view or another appropriate screen
          GoRouter.of(context).push(AppRouter.kHomeView);
        }
        if (state is SigninFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.failure)));
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SigninLoading ? true : false,
          child: SigninViewBody(),
        );
      },
    );
  }
}
