import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:fruit_hub/feature/home/presntation/views/widgets/active_navigation_item_bar.dart';
import 'package:fruit_hub/feature/home/presntation/views/widgets/in_active_navigation_item_bar.dart';

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

// import 'package:flutter/material.dart';
// import 'package:fruit_hub/feature/home/domain/entites/bottom_navigation_bar_entity.dart';
// import 'package:fruit_hub/feature/home/presntation/views/widgets/active_navigation_item_bar.dart';
// import 'package:fruit_hub/feature/home/presntation/views/widgets/in_active_navigation_item_bar.dart';

// class AnimatedNavigationBarItem extends StatelessWidget {
//   final bool isSelected;
//   final BottomNavigationBarEntity entity;

//   const AnimatedNavigationBarItem({
//     super.key,
//     required this.isSelected,
//     required this.entity,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSwitcher(
//       duration: const Duration(milliseconds: 400),
//       transitionBuilder: (child, animation) {
//         // نستخدم Slide + Fade مع بعض
//         return SlideTransition(
//           position: Tween<Offset>(
//             begin: const Offset(0.0, 0.3), // من تحت لفوق
//             end: Offset.zero,
//           ).animate(CurvedAnimation(
//             parent: animation,
//             curve: Curves.easeOutBack,
//           )),
//           child: FadeTransition(
//             opacity: animation,
//             child: child,
//           ),
//         );
//       },
//       child: isSelected
//           ? ActiveNavigationItemBar(
//               key: ValueKey("${entity.name}_active"),
//               image: entity.activeItem,
//               name: entity.name,
//             )
//           : InActiveNavigationItemBar(
//               key: ValueKey("${entity.name}_inactive"),
//               image: entity.inActiveItem,
//             ),
//     );
//   }
// }

