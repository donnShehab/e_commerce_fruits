



import 'dart:developer';

import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/helper_functions/build_error_bar.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_keys.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_button.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/order_input_entity.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/add_order_cubit/add_order_cubit.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/checkout_steps.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/checkout_steps_page_view.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/paypal_check_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:go_router/go_router.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderInputEntity>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CheckoutSteps(
            pageController: pageController,
            currentPageIndex: currentPageIndex,
            onTap: _onStepTap,
          ),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
              formKey: _formKey,
              valueListenable: valueNotifier,
            ),
          ),
          CustomButton(
            text: getNextButtonText(currentPageIndex),
            color: AppColors.primaryColor,
            onPressed: () => _onNextPressed(orderEntity),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _onStepTap(int index) {
    if ((context.read<OrderInputEntity>().payWithCash != null) || index == 0) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      showBar(context, 'يرجى تحديد طريقة الدفع');
    }
  }

  String getNextButtonText(int index) {
    switch (index) {
      case 0:
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع عبر PayPal';
      default:
        return 'التالي';
    }
  }

  void _onNextPressed(OrderInputEntity orderEntity) {
    if (currentPageIndex == 0) {
      if (orderEntity.payWithCash != null) {
        pageController.animateToPage(
          currentPageIndex + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        showBar(context, 'يرجى تحديد طريقة الدفع');
      }
    } else if (currentPageIndex == 1) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        pageController.animateToPage(
          currentPageIndex + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      } else {
        valueNotifier.value = AutovalidateMode.always;
      }
    } else if (currentPageIndex == 2) {
      _processPaypalPayment(orderEntity);
    }
  }

  void _processPaypalPayment(OrderInputEntity orderEntity) {
    PaypalPaymentEntity paypalEntity = PaypalPaymentEntity.fromEntity(
      orderEntity,
    );
    var addOrderCubit = context.read<AddOrderCubit>();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: kPaypalClientId,
          secretKey: kPaypalSecretkEY,
          transactions: [paypalEntity.toJson()],
          note: "Contact us for any questions on your order.",
          onSuccess: (params) async {
            if (!mounted) return;
            Navigator.pop(context);
            addOrderCubit.addOrder(order: orderEntity);

            // Show custom success dialog
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => PaypalCheckoutSuccessDialog(),
            );
          },
          onError: (error) {
            if (!mounted) return;
            Navigator.pop(context);
            showBar(context, 'حدث خطأ في عملية الدفع');
          },
          onCancel: () {
            if (!mounted) return;
            Navigator.pop(context);
            showBar(context, 'تم إلغاء الدفع');
          },
        ),
      ),
    );
  }
}
