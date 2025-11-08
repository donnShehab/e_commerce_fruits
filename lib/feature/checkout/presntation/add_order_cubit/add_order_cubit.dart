import 'package:bloc/bloc.dart';
import 'package:e_coomerce_fruit/core/repos/order_repo/order_repo.dart';
import 'package:e_coomerce_fruit/feature/checkout/domain/entites/order_input_entity.dart';
import 'package:equatable/equatable.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.ordersRepo) : super(AddOrderInitial());
  final OrderRepo ordersRepo;

  void addOrder({required OrderInputEntity order}) async {
    emit(AddOrderLoading());
    final result = await ordersRepo.addOrder(order: order);
    result.fold(
      (failure) => emit(AddOrderFauiler(message: failure.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
