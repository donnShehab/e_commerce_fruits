import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaypalCheckoutSuccessDialog extends StatelessWidget {
  const PaypalCheckoutSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('تم الدفع بنجاح!'),
      content: const Text(
        'شكرًا لك على ثقتك. تمت معالجة عملية الدفع عبر PayPal بنجاح، وسيتم تجهيز طلبك الآن.',
        textAlign: TextAlign.center,
      ),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kHomeView);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'العودة للرئيسية',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
