import 'package:dartz/dartz.dart';
import 'package:e_coomerce_fruit/core/errors/failures.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/order_input_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> addOrder({required OrderInputEntity order});
}
