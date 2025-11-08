import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final String code;
  final String imageUrl;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.code,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
  factory OrderProductModel.fromEntity({
    required CartItemEntity cartItemEntity,
  }) {
    return OrderProductModel(
      code: cartItemEntity.productEntity.code,
      name: cartItemEntity.productEntity.name,
      imageUrl: cartItemEntity.productEntity.imageUrl!,
      price: cartItemEntity.productEntity.price.toDouble(),
      quantity: cartItemEntity.quantity,
    );
  }
  toJson() {
    return {
      'name': name,
      'code': code,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
    };
  }
}
