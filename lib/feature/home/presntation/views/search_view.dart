import 'package:e_coomerce_fruit/core/repos/product_repo/products_repo.dart';
import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/search_cubit/search_cubit_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt.get<ProductsRepo>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('البحث'), // "Search" in Arabic
          // Add filter icon if needed: actions: [IconButton(onPressed: () {}, icon: Icon(Icons.filter_list))],
        ),
        body: const SearchViewBody(),
      ),
    );
  }
}
