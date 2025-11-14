import 'dart:developer';

import 'package:e_coomerce_fruit/constants.dart';
import 'package:e_coomerce_fruit/core/helper_functions/build_error_bar.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_images.dart';
import 'package:e_coomerce_fruit/core/utils/app_keys.dart';
import 'package:e_coomerce_fruit/core/widgets/custom_button.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/order_input_entity.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/add_order_cubit/add_order_cubit.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/checkout_steps.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/widgets/checkout_steps_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

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
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: Column(
        children: [
          SizedBox(height: 20),
          CheckoutSteps(
            onTap: (index) {
              if (currentPageIndex == 0) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              } else if (index == 1) {
                var orderEntity = context.read<OrderInputEntity>();
                if (orderEntity.payWithCash != null) {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                } else {
                  showBar(context, 'يرجي تحديد طريقه الدفع');
                }
              } else {
                _handleAddresValidation();
              }
            },
            pageController: pageController,
            currentPageIndex: currentPageIndex,
          ),

          Expanded(
            child: CheckoutStepsPageView(
              valueListenable: valueNotifier,
              pageController: pageController,
              formKey: _formKey,
            ),
          ),
          CustomButton(
            text: getNextButtonTetx(currentPageIndex),
            onPressed: () {
              if (currentPageIndex == 0) {
                _handleShippingSectionValidate(context);
              } else if (currentPageIndex == 1) {
                _handleAddresValidation();
              } else {
                // var orderEntity = context.read<OrderEntity>();
                // context.read<AddOrderCubit>().addOrder(order: orderEntity);
                _proccessPayment(context);
              }
            },
            color: AppColors.primaryColor,
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }

  void _handleShippingSectionValidate(BuildContext context) {
    if (context.read<OrderInputEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: Duration(microseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      showBar(context, 'يرجى تحديد طريقة الدفع');
    }
  }

  getNextButtonTetx(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع عبر  PayPal';

      default:
        return 'Next';
    }
  }

  void _handleAddresValidation() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: Duration(microseconds: 300),
        curve: Curves.bounceIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _proccessPayment(BuildContext context) {
    var orderEntity = context.read<OrderInputEntity>();
    PaypalPaymentEntity paypalPaymentEntity = PaypalPaymentEntity.fromEntity(
      orderEntity,
    );
    var addOrderCubit = context.read<AddOrderCubit>();
    log(paypalPaymentEntity.toJson().toString());
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: kPaypalClientId,
          secretKey: kPaypalSecretkEY,
          transactions: [paypalPaymentEntity.toJson()],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            Navigator.pop(context);
            addOrderCubit.addOrder(order: orderEntity);
            print("onSuccess: $params");
            showBar(context, ' تمت العملية الدفع بنجاح');
          },
          onError: (error) {
            print("onError: $error");
            Navigator.pop(context);
            showBar(context, 'حدث خطأ في عملية الدفع');
          },
          onCancel: () {
            print('cancelled:');
          },
        ),
      ),
    );
  }
}
