import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/feature/auth/domain/repos/auth_repos.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/cubits/signup_cubits/signup_cubit.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/views/widgwts/signup_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
