  import 'package:flutter/material.dart';

  class OrDivider extends StatelessWidget {
    const OrDivider({super.key});

    @override
    Widget build(BuildContext context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Divider(color: Color(0xffDDDFDF), thickness: 2)),
          SizedBox(width: 16),

          Text('أو'),
          SizedBox(width: 16),

          Expanded(child: Divider(color: Color(0xffDDDFDF), thickness: 2)),
        ],
      );
    }
  }
