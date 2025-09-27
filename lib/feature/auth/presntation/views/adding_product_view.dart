import 'package:flutter/material.dart';
import 'package:fruit_hub/widgets/custom_app_bar.dart';

class AddingProductView extends StatelessWidget {
  const AddingProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 34, 18),
      appBar: buildAppBar(context, title: 'سلة المشتريات'),
    );
  }
}
