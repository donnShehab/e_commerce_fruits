import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_services.dart';
import 'package:fruit_hub/feature/auth/domain/repos/auth_repos.dart';
import 'package:fruit_hub/feature/auth/presntation/cubits/signup_cubits/signup_cubit.dart';
import 'package:fruit_hub/feature/auth/presntation/widgwts/signup_view_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(body: SignupViewBodyBlocConsumer()),
    );
  }
}
