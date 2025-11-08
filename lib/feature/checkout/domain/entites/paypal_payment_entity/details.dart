import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/order_input_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  double? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
    'subtotal': subtotal,
    'shipping': shipping,
    'shipping_discount': shippingDiscount,
  };

  factory DetailsEntity.fromEntity(OrderInputEntity entity) => DetailsEntity(
    subtotal: entity.cartEntity.calculateTotalPrice().toString(),
    shipping: entity.calculateShippingCost().toString(),
    shippingDiscount: entity.calculateShippingDiscount(),
  );
}
