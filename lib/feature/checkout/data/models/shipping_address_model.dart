import 'package:e_coomerce_fruit/feature/checkout/domain/entites/shipping_Address_entity.dart';
import 'package:flutter/foundation.dart';

class ShippingAddressModel {
  String? name;
  String? phone;
  String? address;
  String? email;
  String? addresDetails;
  String? city;

  ShippingAddressModel({
    this.name,
    this.phone,
    this.address,
    this.email,
    this.addresDetails,
    this.city,
  });
  factory ShippingAddressModel.fromEntity(ShippingAddressEntity entity) {
    return ShippingAddressModel(
      name: entity.name,
      addresDetails: entity.addresDetails,
      address: entity.address,
      city: entity.city,
      phone: entity.phone,
      email: entity.email,
    );
  }
  @override
  String toString() {
    return '$address $addresDetails';
  }

  toJson() {
    return {
      'name': name,
      'address': address,
      'addresDetails': addresDetails,
      'city': city,
      'phone': phone,
      'email': email,
    };
  }
}
