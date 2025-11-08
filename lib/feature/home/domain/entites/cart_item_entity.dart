import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;
  CartItemEntity({required this.productEntity, this.quantity = 0});

  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  num calculateToWeight() {
    return productEntity.unitAmount * quantity;
  }

  increasCount() {
    quantity++;
  }

  decreasCount() {
    quantity--;
  }

  @override
  List<Object?> get props => [productEntity];
}
