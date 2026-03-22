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
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 12),
        child: Container(
          height: 72,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF4EA),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: const Color(0xFFE7C39E), width: 1),
            boxShadow: const [
              BoxShadow(
                color: Color(0x12000000),
                blurRadius: 18,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: bottomNavigationBarItem.asMap().entries.map((entry) {
              final index = entry.key;
              final entity = entry.value;

              return Expanded(
                flex: index == selectedIndex ? 4 : 3,
                child: InkWell(
                  borderRadius: BorderRadius.circular(24),
                  onTap: () => onItemSelected(index),
                  child: Center(
                    child: NavigationBarItem(
                      isSelected: selectedIndex == index,
                      bottomNavigationBarEntity: entity,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
