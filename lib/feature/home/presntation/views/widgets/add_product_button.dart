import 'package:flutter/material.dart';

class AddProductButton extends StatelessWidget {
    final VoidCallback onAdd;

  const AddProductButton({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.5),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: const Color(0xff1B5E37),
          borderRadius: BorderRadius.circular(22),
        ),
        child: IconButton(
          onPressed: onAdd,
          icon: const Icon(Icons.add, size: 22, color: Colors.white),
        ),
      ),
    );

  }
}