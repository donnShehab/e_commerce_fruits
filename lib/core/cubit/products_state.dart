part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsFailuer extends ProductsState {
  final String errMessage;

  ProductsFailuer({required this.errMessage});
}

class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;

  ProductsSuccess(this.products);
}
