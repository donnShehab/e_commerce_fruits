import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFF57C00);
    const bgColor = Color(0xFFFFFCF8);
    const darkText = Color(0xFF2F3637);
    const bodyText = Color(0xFF7A7F80);
    const borderColor = Color(0xFFF3D9BE);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  child: const Icon(
                    Icons.close_rounded,
                    size: 22,
                    color: Color(0xFF555555),
                  ),
                ),
              ),
            ),

            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: const Color(0xFFFFF3E6),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.logout_rounded,
                color: primaryColor,
                size: 30,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'هل تريد تسجيل الخروج؟',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: darkText,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'يمكنك تسجيل الدخول مرة أخرى في أي وقت.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, height: 1.7, color: bodyText),
            ),

            const SizedBox(height: 22),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: borderColor),
                      foregroundColor: primaryColor,
                      minimumSize: const Size.fromHeight(52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'إلغاء',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      GoRouter.of(context).go(AppRouter.kSigninView);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      minimumSize: const Size.fromHeight(52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
