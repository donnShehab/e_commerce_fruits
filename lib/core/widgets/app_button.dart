import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

enum AppButtonVariant { filled, outlined, compact }

/// الزر الموحد للتطبيق — يستبدل CustomButton و CustomButtonSocialMediaa
/// و FeaturedItemButton و ElevatedButton.icon
class AppButton extends StatelessWidget {
  const AppButton.filled({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.leading,
  }) : variant = AppButtonVariant.filled;

  const AppButton.outlined({
    super.key,
    required this.text,
    required this.onPressed,
    this.leading,
  }) : variant = AppButtonVariant.outlined,
       color = Colors.transparent;

  const AppButton.compact({
    super.key,
    required this.text,
    required this.onPressed,
  }) : variant = AppButtonVariant.compact,
       leading = null,
       color = Colors.white;

  final AppButtonVariant variant;
  final String text;
  final VoidCallback? onPressed;
  final Color color;

  /// أيقونة أو صورة تظهر في بداية الزر (اختياري)
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case AppButtonVariant.filled:
        return _buildFilled();
      case AppButtonVariant.outlined:
        return _buildOutlined();
      case AppButtonVariant.compact:
        return _buildCompact();
    }
  }

  Widget _buildFilled() {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        // نفس سلوك التعطيل السابق
        color: onPressed != null ? color : color.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: leading == null
            ? Text(
                text,
                style: TextStyles.bold16.copyWith(color: Colors.white),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  leading!,
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.bold16.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildOutlined() {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffDDDFDF), width: 1),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          children: [
            if (leading != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: leading,
              ),
            // Expanded بدل SizedBox(width: 60) الثابت — يمنع overflow على 320dp
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.semiBold16.copyWith(color: Colors.black),
              ),
            ),
            // يوازن عرض الأيقونة حتى يبقى النص في المنتصف بصريًا
            if (leading != null) const SizedBox(width: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildCompact() {
    return SizedBox(
      height: 32,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          backgroundColor: Colors.white,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FittedBox(
            child: Text(
              text,
              style: TextStyles.bold13.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
