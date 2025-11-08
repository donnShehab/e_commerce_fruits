import 'package:e_coomerce_fruit/feature/checkout/data/models/order_product_model.dart';
import 'package:e_coomerce_fruit/feature/checkout/data/models/shipping_address_model.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/order_input_entity.dart';
import 'package:uuid/uuid.dart';

class OrderModel {
  final double totalPrice;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;
  final String orderID;

  OrderModel({
    required this.orderID,
    required this.totalPrice,
    required this.uId,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromEntity(OrderInputEntity orderEntity) {
    return OrderModel(
      orderID: Uuid().v4(),
      totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
      uId: orderEntity.uId,
      shippingAddressModel: ShippingAddressModel.fromEntity(
        orderEntity.shippingAddressEntity,
      ),
      orderProducts: orderEntity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(cartItemEntity: e))
          .toList(),
      paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'Paypal',
    );
  }
  toJson() => {
    'orderId': orderID,
    'totalPrice': totalPrice,
    'uId': uId,
    'status': 'pending',
    'date': DateTime.now().toString(),
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };
}
