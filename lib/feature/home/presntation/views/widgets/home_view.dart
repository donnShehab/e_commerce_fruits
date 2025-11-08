import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/cubit/products_cubit.dart';
import 'package:e_coomerce_fruit/core/repos/product_repo/products_repo.dart';
import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_grid_view.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_header.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/featured_list.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/home_view_body.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/profile_home.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/search_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: HomeViewBody(),
    );
  }
}
