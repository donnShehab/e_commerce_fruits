import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' as svg;

class InActiveNavigationItemBar extends StatelessWidget {
  const InActiveNavigationItemBar({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: svg.SvgPicture.asset(image),
    );
  }
}
