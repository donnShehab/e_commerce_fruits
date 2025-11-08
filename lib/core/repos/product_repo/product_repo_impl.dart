// import 'package:dartz/dartz.dart';
// import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
// import 'package:e_coomerce_fruit/core/errors/failures.dart';
// import 'package:e_coomerce_fruit/core/models/product_model.dart';
// import 'package:e_coomerce_fruit/core/repos/product_repo/products_repo.dart';
// import 'package:e_coomerce_fruit/core/services/database_service.dart';
// import 'package:e_coomerce_fruit/core/utils/backend_endpoint.dart';

// class ProductRepoImpl implements ProductsRepo {
//   final DataBaseService databaseService;

//   ProductRepoImpl(this.databaseService,);
//   @override
//   Future<Either<Failure, List<ProductEntity>>> getProducts() async {
//     try {
//       var data =
//           await databaseService.getData(path: BackendEndpoint.getProducts)
//               as List<Map<String, dynamic>>;
//       // productModel
//       List<ProductEntity> products = data
//           .map((e) => ProductModel.fromJson(e).toEntity())
//           .toList();
//       // List<ProductEntity> productsEntities = products
//       //     .map((e) => e.toEntity())
//       //     .toList();
//       return right(products);
//     } catch (e) {
//       return Left(ServerFailure(message: 'Failed to get product'));
//     }
//   }

//   @override
//   Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
//     try {
//       var data =
//           await databaseService.getData(
//                 path: BackendEndpoint.getProducts,

//                 query: {
//                   'limt': 10,
//                   'orderBy' : 'sellingCount',
//                   'descending' :true,
//                   },
//               )
//               as List<Map<String, dynamic>>;
//       // productModel
//       List<ProductEntity> products = data
//           .map((e) => ProductModel.fromJson(e).toEntity())
//           .toList();
//       // List<ProductEntity> productsEntities = products
//       //     .map((e) => e.toEntity())
//       //     .toList();
//       return right(products);
//     } catch (e) {
//       return Left(ServerFailure(message: 'Failed to get product'));
//     }
//   }
// }
import 'package:dartz/dartz.dart';
import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
import 'package:e_coomerce_fruit/core/errors/failures.dart';
import 'package:e_coomerce_fruit/core/models/product_model.dart';
import 'package:e_coomerce_fruit/core/repos/product_repo/products_repo.dart';
import 'package:e_coomerce_fruit/core/services/database_service.dart';
import 'package:e_coomerce_fruit/core/utils/backend_endpoint.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DataBaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data =
          await databaseService.getData(
                path: BackendEndpoint.getProducts,
                query: {
                  'limit': 10,
                  'orderBy': 'sellingCount',
                  'descending': true,
                },
              )
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(message: 'Failed to get products'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseService.getData(path: BackendEndpoint.getProducts)
              as List<Map<String, dynamic>>;

      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return right(products);
    }
    // catch (e) {
    //   return left(ServerFailure(message: 'Failed to get products'));
    // }
    catch (e, stackTrace) {
      print('🔥 ERROR in getProducts: $e');
      print(stackTrace);
      return Left(ServerFailure(message: 'Failed to get product'));
    }
  }
}
