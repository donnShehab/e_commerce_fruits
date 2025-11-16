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
        width: 24,
        height: 24,
        padding: EdgeInsets.all(2),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(100),
          ),
        ),
        child: FittedBox(child: Icon(icon, color: iconColor)),
      ),
    );
  }
}
