part of 'cart_item_cubit.dart';

abstract class CartItemState {
  const CartItemState();
}

class CartItemInitial extends CartItemState {}

class CartItemUpdate extends CartItemState {
  final CartItemEntity cartItemEntity;

  CartItemUpdate(this.cartItemEntity);
}
