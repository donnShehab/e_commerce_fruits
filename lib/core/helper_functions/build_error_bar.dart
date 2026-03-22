import 'package:e_coomerce_fruit/core/helper_functions/showSuccessSnackBar.dart';
import 'package:flutter/material.dart';

void showBar(BuildContext context, String message) {
  
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     behavior: SnackBarBehavior.floating,
  //     duration: const Duration(seconds: 1),
  //     content: Text(message),
  //   ),
  // );
  showSuccessSnackBar(context, message);
}
