import 'package:dartz/dartz.dart';
import 'package:e_coomerce_fruit/core/errors/failures.dart';
import 'package:e_coomerce_fruit/core/repos/order_repo/order_repo.dart';
import 'package:e_coomerce_fruit/core/services/database_service.dart';
import 'package:e_coomerce_fruit/core/services/firestore_service.dart';
import 'package:e_coomerce_fruit/core/utils/backend_endpoint.dart';
import 'package:e_coomerce_fruit/feature/checkout/data/models/order_model.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/order_input_entity.dart';

class OrderRepoImpl implements OrderRepo {
  final DataBaseService firestoreService;

  OrderRepoImpl(this.firestoreService);
  @override
  Future<Either<Failure, void>> addOrder({
    required OrderInputEntity order,
  }) async {
    try {
      var orderModel = OrderModel.fromEntity(order);
      await firestoreService.addData(
        path: BackendEndpoint.addOrder,
        documentId: orderModel.orderID,
        data: orderModel.toJson(),
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
