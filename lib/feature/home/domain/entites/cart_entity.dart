import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_item_entity.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/add_product_button.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);
  addCartItem(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  removeCartItem(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calculateTotalPrice();
    }
    return double.parse(totalPrice.toStringAsFixed(2));
  }

  bool isExist(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity product) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == product) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: product, quantity: 1);
  }
}
