import 'package:flutter/material.dart';

void showSuccessSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(Icons.check_circle_rounded, color: Colors.white, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFF4A3B34),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 18),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      duration: const Duration(seconds: 2),
    ),
  );
}
