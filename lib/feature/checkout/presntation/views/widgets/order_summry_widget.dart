import 'package:e_coomerce_fruit/feature/checkout/domain/entites/order_input_entity.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/shipping_Address_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_text_styles.dart';
import 'payment_item.dart';

class OrderSummryWidget extends StatelessWidget {
  const OrderSummryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentItem(
          title: 'ملخص الطلب',
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'المجموع الفرعي :',
                    style: TextStyles.regular13.copyWith(
                      color: const Color(0xFF4E5556),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice()}دينار',
                    textAlign: TextAlign.right,
                    style: TextStyles.semiBold16,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    'التوصيل  :',
                    style: TextStyles.regular13.copyWith(
                      color: const Color(0xFF4E5556),
                    ),
                  ),
                  const SizedBox(width: 237),
                  Text(
                    '3 دنانير',
                    textAlign: TextAlign.right,
                    style: TextStyles.regular13.copyWith(
                      color: const Color(0xFF4E5556),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 9),
              const Divider(
                height: 0,
                indent: 20,
                endIndent: 35,
                color: Color(0xFFCACECE),
              ),
              const SizedBox(height: 9),
              Row(
                children: [
                  const Text('الكلي', style: TextStyles.bold16),
                  const Spacer(),
                  Text(
                    '${(context.read<OrderInputEntity>().cartEntity.calculateTotalPrice() + 3).toStringAsFixed(2)}  دنانير',
                    style: TextStyles.bold16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
