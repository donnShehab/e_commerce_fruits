import 'package:bloc/bloc.dart';
import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
import 'package:e_coomerce_fruit/core/repos/product_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductsRepo productsRepo;
  int productsLength = 0;
  // Add this private list (after productsLength)


  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();

    result.fold(
      (failure) {
        print('🔥🔥🔥 ProductsCubit failure: ${failure.message}');
        emit(ProductsFailuer(errMessage: failure.message));
      },
      (products) {
        print('✅ ProductsCubit success: ${products.length} products loaded');
        productsLength = products.length;
        emit(ProductsSuccess(products));
      },
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductsFailuer(errMessage: failure.message)),
      // (products) => emit(ProductsSuccess(products)),
      (products) {
        productsLength = products.length;
        emit(ProductsSuccess(products));
      },
    );
  }
  
}
