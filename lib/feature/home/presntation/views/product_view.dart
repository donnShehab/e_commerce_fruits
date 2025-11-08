// products_view.dart
import 'package:e_coomerce_fruit/core/cubit/products_cubit.dart';
import 'package:e_coomerce_fruit/core/repos/product_repo/products_repo.dart';
import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/product_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductsRepo>()),
      child: ProductViewBody(),
    );
  }
}
