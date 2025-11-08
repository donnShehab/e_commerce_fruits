import 'package:e_coomerce_fruit/feature/checkout/domain/entites/order_input_entity.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/shipping_item.dart';
import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    var orderEntity = context.read<OrderInputEntity>();
    return Column(
      children: [
        SizedBox(height: 33),
        ShippingItem(
          onTap: () {
            selectedIndex = 0;

            setState(() {});
            orderEntity.payWithCash = true;
          },
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم عند المكان',
          price: (orderEntity.cartEntity.calculateTotalPrice() + 3).toString(),
          isSelected: selectedIndex == 0,
        ),
        SizedBox(height: 10),
        ShippingItem(
          onTap: () {
            selectedIndex = 1;
            setState(() {});
            orderEntity.payWithCash = false;
          },
          title: ' الدفع اونلاين',
          subTitle: ' يرجى تحديد طريقه الدفع ',
          price: orderEntity.cartEntity.calculateTotalPrice().toString(),
          isSelected: selectedIndex == 1,
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
