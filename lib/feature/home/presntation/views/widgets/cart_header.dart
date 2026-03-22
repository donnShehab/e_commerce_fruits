import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.watch<CartCubit>().cartEntity.cartItems.length;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6EE),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFF1E5D8),
          width: 1,
        ),
      ),
      child: Text(
        'لديك $count منتجات في سلة التسوق',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Color(0xFF9A6B3D),
          fontSize: 13,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}