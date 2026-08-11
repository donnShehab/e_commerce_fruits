import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.price,
    required this.subTitle,
    required this.isSelected,
    required this.onTap,
  });
  final String title, price, subTitle;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: Container(
          padding: EdgeInsets.only(top: 16, left: 13, right: 28, bottom: 16),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(0x33D9D9D9),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isSelected ? AppColors.primaryColor : Colors.transparent,
              ),
              borderRadius: BorderRadiusGeometry.circular(4),
            ),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShippingItemDot(isActive: isSelected),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyles.semiBold13.copyWith()),
                    SizedBox(height: 6),
                    Text(
                      subTitle,
                      textAlign: TextAlign.right,
                      style: TextStyles.regular13.copyWith(
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Center(
                  child: Text(
                    price,
                    style: TextStyles.bold13.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShippingItemDot extends StatelessWidget {
  const ShippingItemDot({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    if (!isActive) {
      return Container(
        width: 18,
        height: 18,
        decoration: ShapeDecoration(
          shape: OvalBorder(
            side: BorderSide(width: 2, color: Color(0xFF949D9E)),
          ),
        ),
      );
    }
    return Container(
      padding: EdgeInsets.all(2),
      width: 18,
      height: 18,
      decoration: ShapeDecoration(
        shape: OvalBorder(side: BorderSide(width: 1, color: Color(0xFF949D9E))),
      ),
      child: Container(
        width: 18,
        height: 18,
        decoration: ShapeDecoration(
          shape: OvalBorder(),
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
