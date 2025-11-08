import 'package:flutter/material.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.selectedIndex,
    required List<Widget> pages,
  }) : pages = pages;

  final int selectedIndex;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(index: selectedIndex, children: pages);
  }
}
