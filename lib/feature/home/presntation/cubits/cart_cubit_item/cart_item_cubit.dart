import 'package:bloc/bloc.dart';
import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_item_entity.dart';
import 'package:equatable/equatable.dart';

part 'cart_item_state.dart';

class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void updateCartItem(CartItemEntity cartItem) {
    emit(CartItemUpdate(cartItem));
  }
}
