import 'package:e_coomerce_fruit/core/entities/product_entity.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<ProductEntity> products;
  final List<String> recentSearches;
  SearchLoaded({required this.products, required this.recentSearches});
}

class SearchFailure extends SearchState {
  final String errMessage;
  SearchFailure({required this.errMessage});
}
