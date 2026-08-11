import 'package:e_coomerce_fruit/feature/home/presntation/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/navigation_item_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    // top: false — الشريط في الأسفل، نحتاج فقط تعويض شريط الإيماءات
    return SafeArea(
      top: false,
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 25,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: bottomNavigationBarItem.asMap().entries.map((entry) {
            final index = entry.key;
            final entity = entry.value;

            return Expanded(
              flex: index == selectedIndex ? 4 : 3,
              child: GestureDetector(
                onTap: () => onItemSelected(index),
                child: NavigationBarItem(
                  isSelected: selectedIndex == index,
                  bottomNavigationBarEntity: entity,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
