import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InActiveNavigationItemBar extends StatelessWidget {
  const InActiveNavigationItemBar({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 22,
        height: 22,
        child: SvgPicture.asset(
          image,
          colorFilter: const ColorFilter.mode(
            Color(0xFF6D6D6D),
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
