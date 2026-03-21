import 'package:flutter/material.dart';

import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_text_styles.dart';

class FruitItem extends StatelessWidget {
  final String imagePath;

  const FruitItem({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 163,
      // height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffF3F5F7),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -1,
            right: -3,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Image.asset(imagePath),
                const SizedBox(height: 24),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: kHorizintalPadding),
                //   child: Align(
                //     alignment: Alignment.centerRight,
                //     child: Text(
                //       name,
                //       style: TextStyles.semiBold13.copyWith(
                //         color: Colors.black,
                //         fontWeight: FontWeight.w700,
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 4),
                // Row(
                //   children: [
                //     Text(
                //       price,
                //       style: TextStyles.bold13.copyWith(
                //         color: AppColors.secondryColor,
                //       ),
                //     ),
                //     Text(
                //       unit,
                //       style: TextStyles.semiBold13.copyWith(
                //         color: AppColors.lightSecondryColor,
                //       ),
                //     ),
                //     const Spacer(),
                //     AddProductButton(
                //       onAdd: () {
                //         GoRouter.of(context).push(AppRouter.kAddingProductView);
                //       },
                //     ),
                //   ],
                // ),
                ListTile(
                  title: Text(
                    'البطيخ',
                    textAlign: TextAlign.right,
                    style: TextStyles.semiBold16,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '20دينار',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.secondryColor,
                          ),
                        ),
                        TextSpan(
                          text: '/',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.lightSecondryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyles.bold13.copyWith(),
                        ),
                        TextSpan(
                          text: 'الكيلو',
                          style: TextStyles.bold13.copyWith(
                            color: AppColors.lightSecondryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
