import 'package:flutter/material.dart';

class CustomErrMessage extends StatelessWidget {
  const CustomErrMessage({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text));
  }
}
