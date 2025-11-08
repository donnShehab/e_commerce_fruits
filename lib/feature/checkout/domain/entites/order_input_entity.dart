import 'package:e_coomerce_fruit/feature/checkout/domain/entites/shipping_Address_entity.dart';
import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_entity.dart';

class OrderInputEntity {
  final String uId;
  final CartEntity cartEntity;
  bool? payWithCash;
  final ShippingAddressEntity shippingAddressEntity;
  OrderInputEntity(
    this.cartEntity, {
    this.payWithCash,
    required this.uId,
    required this.shippingAddressEntity,
  });
  calculateShippingCost() {
    if (payWithCash!) {
      return 3;
    } else {
      return 0;
    }
  }

  double calculateShippingDiscount() {
    return 0;
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }
}
