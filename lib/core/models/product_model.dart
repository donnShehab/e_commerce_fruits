// import 'dart:io';

// import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
// import 'package:e_coomerce_fruit/core/helper_functions/get_avg_rating.dart';
// import 'package:e_coomerce_fruit/core/models/review_model.dart';

// class ProductModel {
//   final String name;
//   final String code;
//   final String description;
//   final num price;
//   final bool isFeatured;
//   String? imageUrl;
//   final int expirationsMonths;
//   final bool isOrganic;
//   final int numberOfCalories;
//   final num avgRating ;
//   final int unitAmount;
//   final int sellingCount;
//   final List<ReviewModel> reviews;
//   ProductModel( {
//    required this.avgRating,
//     required this.name,
//     required this.code,
//     required this.description,
//     required this.expirationsMonths,
//     required this.numberOfCalories,
//     required this.unitAmount,
//     required this.reviews,
//     required this.price,
//     this.sellingCount = 0,
//     required this.isOrganic,
//     required this.isFeatured,
//     this.imageUrl,
//   });

//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       avgRating: getAvgRating(
//         json['reviews'] != null
//             ? List<ReviewModel>.from(
//                 json['reviews'].map((e) => ReviewModel.fromJson(e)),
//               )
//             : [],
//       ),
//       // avgRating : getAvgRating(json ['reviews']),
//       name: json['name'],
//       code: json['code'],
//       description: json['description'],
//       expirationsMonths: json['expirationsMonths'],
//       numberOfCalories: json['numberOfCalories'],
//       unitAmount: json['unitAmount'],
//       sellingCount: json['sellingCount'],
//       reviews: json['reviews'] != null
//           ? List<ReviewModel>.from(
//               json['reviews'].map((e) => ReviewModel.fromJson(e)),
//             )
//           : [],
//       price: json['price'],
//       isOrganic: json['isOrganic'],
//       isFeatured: json['isFeatured'],
//       imageUrl: json['imageUrl'],
//     );
//   }
//   ProductEntity toEntity() {
//     return ProductEntity(
//       name: name,
//       code: code,
//       description: description,
//       price: price,
//       reviews: reviews.map((e) => e.toEntity()).toList(),
//       expirationsMonths: expirationsMonths,
//       numberOfCalories: numberOfCalories,
//       unitAmount: unitAmount,
//       isOrganic: isOrganic,
//       isFeatured: isFeatured,
//       imageUrl: imageUrl,
//     );
//   }

//   toJson() {
//     return {
//       'name': name,
//       'code': code,
//       'sellingCount': sellingCount,
//       'description': description,
//       'price': price,
//       'isFeatured': isFeatured,
//       'imageUrl': imageUrl,
//       'expirationsMonths': expirationsMonths,
//       'numberOfCalories': numberOfCalories,
//       'unitAmount': unitAmount,
//       'isOrganic': isOrganic,
//       'reviews': reviews.map((e) => e.toJson()).toList(),

//     };
//   }
// }
import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
import 'review_model.dart';
import '../helper_functions/get_avg_rating.dart';

class ProductModel {
  final String id;
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final int unitAmount;
  final int sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.id,
    required this.avgRating,
    required this.name,
    required this.code,
    required this.description,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    required this.price,
    this.sellingCount = 0,
    required this.isOrganic,
    required this.isFeatured,
    this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    // تحويل reviews مع حماية null
    List<ReviewModel> reviewsList = [];
    if (json['reviews'] != null && json['reviews'] is List) {
      reviewsList = List<ReviewModel>.from(
        json['reviews'].map((e) => ReviewModel.fromJson(e)),
      );
    }

    return ProductModel(
      id: json['id'] ?? '', // حماية null
      avgRating: getAvgRating(reviewsList),
      name: json['name'] ?? '', // حماية null
      code: json['code'] ?? '',
      description: json['description'] ?? '',
      expirationsMonths: json['expirationsMonths'] ?? 0,
      numberOfCalories: json['numberOfCalories'] ?? 0,
      unitAmount: json['unitAmount'] ?? 0,
      sellingCount: json['sellingCount'] ?? 0,
      reviews: reviewsList,
      price: (json['price'] ?? 0).toDouble(), // ضمان double
      isOrganic: json['isOrganic'] ?? false,
      isFeatured: json['isFeatured'] ?? false,
      imageUrl: json['imageUrl'] ?? null, // nullable
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id,
      name: name,
      code: code,
      description: description,
      price: price,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      expirationsMonths: expirationsMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isOrganic: isOrganic,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'sellingCount': sellingCount,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
