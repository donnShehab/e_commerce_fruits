import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_item_entity.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/cart_item.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/custom_divider.dart';
import 'package:flutter/material.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) {
        return CustomDivider();
      },
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: CartItem(cartItemEntity: cartItems[index]),
      ),
      itemCount: cartItems.length,
    );
  }
}
