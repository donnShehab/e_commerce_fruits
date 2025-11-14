import 'package:flutter/material.dart';

class PaypalCheckoutViewSuccess extends StatelessWidget {
  const PaypalCheckoutViewSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    // i need create implementation for this view
    return Scaffold(
      appBar: AppBar(
        title: Text('نجاح الدفع عبر باي بال'),
      ),
      body: Center(
        child: Text(
          'تمت عملية الدفع بنجاح عبر باي بال!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}