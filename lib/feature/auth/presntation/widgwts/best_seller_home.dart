import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/auth/presntation/widgwts/item_card_product.dart';
import 'package:fruit_hub/feature/auth/presntation/widgwts/section_header_best_seller.dart';
import 'package:fruit_hub/utils/app_images.dart';

class BestSellerHome extends StatelessWidget {
  const BestSellerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // بس للتنظيم
      children: [
        SectionHeaderBestSeller(
         
        ),
        const SizedBox(height: 8),

        /// الحل: استخدام shrinkWrap + تعطيل السكرول
        GridView.builder(
          shrinkWrap: true, // يخليها تاخد حجم العناصر فقط
          physics: const NeverScrollableScrollPhysics(), // تمنع التمرير
          // itemCount: products.length,
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عمودين
            crossAxisSpacing: 8, // مسافة بين الأعمدة
            mainAxisSpacing: 8, // مسافة بين الصفوف
            childAspectRatio: 0.75, // تتحكم بنسبة العرض للطول
          ),
          itemBuilder: (BuildContext context, int index) {
            // final product = products[index];
            return ItemCardProduct(
              imagePath: Assets.imagesWatermelon,
              name: 'بطيخ',
              price: '20 جنية',
              unit: '/الكيلو',
            );
          },
        ),
      ],
    );
  }
}
