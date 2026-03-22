import 'package:flutter/material.dart';

class CartItemActionCircual extends StatelessWidget {
  const CartItemActionCircual({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.color,
    required this.iconColor,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: Icon(icon, color: iconColor, size: 18),
      ),
    );
  }
}
