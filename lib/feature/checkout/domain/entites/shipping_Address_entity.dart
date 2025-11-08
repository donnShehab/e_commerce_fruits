class ShippingAddressEntity {
  String? name;
  String? phone;
  String? address;
  String? email;
  String? addresDetails;
  String? city;

  ShippingAddressEntity({
    this.name,
    this.phone,
    this.address,
    this.email,
    this.addresDetails,
    this.city,
  });
  @override
  String toString() {
    return '$address $addresDetails $city';
  }
}
