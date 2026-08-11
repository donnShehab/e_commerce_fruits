import 'package:flutter/material.dart';

/// زر دائري بأيقونة — يستبدل CartItemActionCircual و AddProductButton
/// وزر الإضافة داخل FruitItem.
///
/// [visualSize] هو الحجم المرئي للدائرة، بينما [tapTargetSize] هي مساحة اللمس
/// الفعلية (48dp افتراضيًا حسب إرشادات إمكانية الوصول).
class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.color,
    required this.iconColor,
    this.visualSize = 24,
    this.tapTargetSize = 48,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final Color iconColor;
  final double visualSize;
  final double tapTargetSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: SizedBox(
        width: tapTargetSize,
        height: tapTargetSize,
        child: Center(
          child: Container(
            width: visualSize,
            height: visualSize,
            padding: const EdgeInsets.all(2),
            decoration: ShapeDecoration(
              color: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(100),
              ),
            ),
            child: FittedBox(child: Icon(icon, color: iconColor)),
          ),
        ),
      ),
    );
  }
}
