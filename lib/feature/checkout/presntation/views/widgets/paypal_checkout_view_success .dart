import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaypalCheckoutViewSuccess extends StatelessWidget {
  const PaypalCheckoutViewSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryOrange = Color(0xFFF57C00);
    const softOrange = Color(0xFFFFF3E6);
    const darkText = Color(0xFF2F3637);
    const bodyText = Color(0xFF7A7F80);
    const successGreen = Color(0xFF34A853);

    final orderNumber = DateTime.now().millisecondsSinceEpoch.toString();

    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(context).go(AppRouter.kHomeView);
                  },
                  icon: const Icon(Icons.close_rounded, size: 26),
                ),
              ),

              const Spacer(),

              Container(
                width: 118,
                height: 118,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: softOrange,
                  boxShadow: [
                    BoxShadow(
                      color: primaryOrange.withOpacity(0.12),
                      blurRadius: 22,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                  child: Container(
                    width: 82,
                    height: 82,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: successGreen,
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 46,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              Text(
                'تم الدفع بنجاح',
                style: TextStyles.bold19.copyWith(
                  fontSize: 28,
                  color: darkText,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              Text(
                'شكرًا لك على ثقتك. تم تأكيد عملية الدفع بنجاح، وبدأنا الآن بتجهيز طلبك ليوصل إليك بأفضل حالة.',
                style: TextStyles.regular13.copyWith(
                  color: bodyText,
                  height: 1.9,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFF1E3D3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _SuccessInfoRow(
                      title: 'حالة الطلب',
                      value: 'قيد التجهيز',
                      valueColor: successGreen,
                    ),
                    const SizedBox(height: 12),
                    const Divider(height: 1),
                    const SizedBox(height: 12),
                    _SuccessInfoRow(
                      title: 'طريقة الدفع',
                      value: 'PayPal',
                      valueColor: darkText,
                    ),
                    const SizedBox(height: 12),
                    const Divider(height: 1),
                    const SizedBox(height: 12),
                    _SuccessInfoRow(
                      title: 'رقم العملية',
                      value: '#$orderNumber',
                      valueColor: bodyText,
                    ),
                  ],
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go(AppRouter.kHomeView);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: primaryOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Text(
                    'العودة للرئيسية',
                    style: TextStyles.bold13.copyWith(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              TextButton(
                onPressed: () {
                  GoRouter.of(context).go(AppRouter.kHomeView);
                },
                child: Text(
                  'متابعة التسوق',
                  style: TextStyles.semiBold13.copyWith(color: primaryOrange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SuccessInfoRow extends StatelessWidget {
  const _SuccessInfoRow({
    required this.title,
    required this.value,
    required this.valueColor,
  });

  final String title;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.left,
            style: TextStyles.semiBold13.copyWith(color: valueColor),
          ),
        ),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.right,
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF7A7F80),
            ),
          ),
        ),
      ],
    );
  }
}
