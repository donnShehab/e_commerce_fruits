import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:e_coomerce_fruit/core/helper_functions/get_currency.dart';
import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_item_entity.dart';

import 'item.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };

  factory ItemEntity.fromEntity(CartItemEntity itemEntity) {
    return ItemEntity(
      name: itemEntity.productEntity.name,
      quantity: itemEntity.quantity,
      price: itemEntity.productEntity.price.toString(),
      currency: getCurrency(),
    );
  }
}
