part of 'add_order_cubit.dart';

abstract class AddOrderState extends Equatable {
  const AddOrderState();

  @override
  List<Object> get props => [];
}

class AddOrderInitial extends AddOrderState {}

class AddOrderLoading extends AddOrderState {}

class AddOrderFauiler extends AddOrderState {
  final String message;

  AddOrderFauiler({required this.message});
}

class AddOrderSuccess extends AddOrderState {}
