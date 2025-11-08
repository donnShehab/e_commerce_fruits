import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/order_input_entity.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingAddresWidget extends StatelessWidget {
  const ShippingAddresWidget({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'عنوان التوصيل',

      child: Row(
        children: [
          Icon(Icons.location_on_outlined, color: Color(0xFF4E5556)),
          SizedBox(width: 2),
          Text(
            '${context.read<OrderInputEntity>().shippingAddressEntity}',
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
          Spacer(),
          Icon(Icons.edit_location_outlined, color: Color(0xFF4E5556)),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(
                1,
                duration: Duration(microseconds: 300),
                curve: Curves.easeIn,
              );
            },
            child: Text(
              'تعديل',
              style: TextStyles.regular13.copyWith(
                color: const Color(0xFF4E5556),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
