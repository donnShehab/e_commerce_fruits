import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/helper_functions/app_router.dart';
import 'package:fruit_hub/utils/app_images.dart';
import 'package:fruit_hub/utils/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class ItemCardProduct extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final String unit;

  const ItemCardProduct({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: 214,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffF3F5F7),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -1,
            right: -3,
            child: Image.asset(Assets.imagesVector, height: 40, width: 40),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(imagePath),
                const SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      name,
                      style: TextStyles.semiBold13.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyles.bold13.copyWith(
                        color: const Color(0xffF4A91F),
                      ),
                    ),
                    Text(
                      unit,
                      style: TextStyles.semiBold13.copyWith(
                        color: const Color(0xffF4A91F),
                      ),
                    ),
                    const Spacer(),
                    AddProduct(
                      onAdd: () {
                        GoRouter.of(context).push(AppRouter.kAddingProductView);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddProduct extends StatelessWidget {
  const AddProduct({super.key, required this.onAdd});
  final VoidCallback onAdd;

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
