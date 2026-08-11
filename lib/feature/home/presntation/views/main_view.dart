import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/cart_view.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/product_view.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/profile_view.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/custom_bottom_navigation.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/home_view.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/main_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;

  void onTabSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Builder(
        builder: (context) {
          // ✅ pages داخل الـ Bloc tree
          final List<Widget> pages = [
            const HomeView(),
            const ProductsView(),
            const CartView(),
            const ProfileView(),
          ];

          return Scaffold(
            body: MainViewBodyBlocConsumer(
              selectedIndex: selectedIndex,
              pages: pages,
            ),
            bottomNavigationBar: CustomBottomNavigation(
              selectedIndex: selectedIndex,
              onItemSelected: onTabSelected,
            ),
          );
        },
      ),
    );
  }
}
