// import 'package:flutter/material.dart';
// import 'package:fruit_hub/constants.dart';
// import 'package:fruit_hub/feature/auth/presntation/widgwts/custom_notification.dart';
// import 'package:fruit_hub/feature/auth/presntation/widgwts/featured_list.dart';
// import 'package:fruit_hub/feature/auth/presntation/widgwts/profile_home.dart';
// import 'package:fruit_hub/utils/app_images.dart';
// import 'package:fruit_hub/utils/app_text_styles.dart';

// class MoreProductView extends StatelessWidget {
//   const MoreProductView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("الأكثر مبيعًا", style: TextStyles.bold19),
//         centerTitle: true,
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           child: Icon(Icons.arrow_back_ios_new),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsetsGeometry.symmetric(
//               horizontal: kHorizintalPadding,
//             ),
//             child: CustomNofitication(),
//           ),
//         ],
//       ),
//       body: GridView.builder(
//         shrinkWrap: true, // يخليها تاخد حجم العناصر فقط
//         // physics: const NeverScrollableScrollPhysics(), // تمنع التمرير
//         // itemCount: products.length,
//         itemCount: 9,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2, // عمودين
//           crossAxisSpacing: 8, // مسافة بين الأعمدة
//           mainAxisSpacing: 8, // مسافة بين الصفوف
//           childAspectRatio: 0.75, // تتحكم بنسبة العرض للطول
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           // final product = products[index];
//           return FeaturedList(
//             imagePath: Assets.imagesWatermelon,
//             name: 'بطيخ',
//             price: '20 جنية',
//             unit: '/الكيلو',
//           );
//         },
//       ),
//     );
//   }
// }
