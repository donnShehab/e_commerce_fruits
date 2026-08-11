import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AddProductButton extends StatelessWidget {
  final VoidCallback onAdd;

  const AddProductButton({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.5),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(22),
        ),
        child: IconButton(
          onPressed: onAdd,
          icon: const Icon(Icons.add, size: 22, color: Colors.white),
        ),
      ),
    );
  }
}
