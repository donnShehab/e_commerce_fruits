import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_services.dart';
import 'package:fruit_hub/feature/auth/domain/repos/auth_repos.dart';
import 'package:fruit_hub/feature/auth/presntation/cubits/signin_cubits/signin_cubit.dart';
import 'package:fruit_hub/feature/auth/presntation/widgwts/signin_view_bloc_consumer.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // هي مكتبة لإدارة الاعتماديات في فلاتر
      // تساعد في تسهيل الوصول إلى الكائنات المعتمدة في جميع أنحاء التطبيق
      create: (context) => SigninCubit(getIt<AuthRepo>()),
      child: Scaffold(body: SigninViewBlocConsumer()),
    );
  }
}
