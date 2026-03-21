// import 'package:e_coomerce_fruit/feature/home/domain/entites/bottom_navigation_bar_entity.dart';
// import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/navigation_item_bar.dart';
// import 'package:flutter/material.dart';

// class CustomBottomNavigation extends StatefulWidget {
//   const CustomBottomNavigation({super.key});

//   @override
//   State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
// }

// class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       width: 375,

//       decoration: ShapeDecoration(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//         ),
//         shadows: [
//           BoxShadow(
//             color: Color(0x19000000),
//             blurRadius: 25,
//             offset: Offset(0, -2),
//             spreadRadius: 0,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: bottomNavigationBarItem.asMap().entries.map((e) {
//           var index = e.key;
//           var entity = e.value;
//           return Expanded(
//             flex: index == selectedIndex ? 4 : 3,
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectedIndex = index;
//                 });
//               },
//               child: NavigationBarItem(
//                 isSelected: selectedIndex == index,
//                 bottomNavigationBarEntity: entity,
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

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
      child: Container(
        height: 80,
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
