import 'package:e_coomerce_fruit/feature/home/presntation/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/active_navigation_item_bar.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/in_active_navigation_item_bar.dart';
import 'package:flutter/material.dart';

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
    return isSelected
        ? ActiveNavigationItemBar(
            image: bottomNavigationBarEntity.activeItem,
            name: bottomNavigationBarEntity.name,
          )
        : InActiveNavigationItemBar(
            image: bottomNavigationBarEntity.inActiveItem,
          );
  }
}
