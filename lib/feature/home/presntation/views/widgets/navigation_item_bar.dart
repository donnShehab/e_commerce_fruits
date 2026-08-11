import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/app_text_styles.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return NavigationItemContent(
      isActive: isSelected,
      name: bottomNavigationBarEntity.name,
      image: isSelected
          ? bottomNavigationBarEntity.activeItem
          : bottomNavigationBarEntity.inActiveItem,
    );
  }
}

class NavigationItemContent extends StatelessWidget {
  const NavigationItemContent({
    super.key,
    required this.isActive,
    required this.name,
    required this.image,
  });
  final bool isActive;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    if (!isActive) {
      return Container(
        color: Colors.transparent,
        child: SvgPicture.asset(image),
      );
    }
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 7),
        decoration: ShapeDecoration(
          color: const Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
            const SizedBox(width: 4),
            // Flexible + ellipsis: يمنع الـ overflow عند تكبير حجم الخط
            Flexible(
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.semiBold11.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
