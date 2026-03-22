
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaypalCheckoutViewSuccess extends StatelessWidget {
  const PaypalCheckoutViewSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FA),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Success Icon
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withOpacity(0.12),
              ),
              child: Icon(Icons.check_circle, color: Colors.green, size: 90),
            ),

            const SizedBox(height: 24),

            // Title
            Text(
              "تم الدفع بنجاح!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 12),

            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "شكرًا لك على ثقتك. تمت معالجة عملية الدفع عبر PayPal بنجاح، وسيتم تجهيز طلبك الآن.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    GoRouter.of(context).go("/home"); // <-- your home route
                  },
                  child: const Text(
                    "العودة للرئيسية",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              "رقم العملية: #${DateTime.now().millisecondsSinceEpoch}",
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
