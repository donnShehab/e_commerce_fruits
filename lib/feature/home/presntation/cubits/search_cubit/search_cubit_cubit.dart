import 'package:bloc/bloc.dart';
import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
import 'package:e_coomerce_fruit/core/repos/product_repo/products_repo.dart';
import 'package:e_coomerce_fruit/core/services/shared_preferences_singleton.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/search_cubit/search_cubit_state.dart';


class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.productsRepo) : super(SearchInitial());
  final ProductsRepo productsRepo;
  List<ProductEntity> _allProducts = [];
  List<String> _recentSearches = [];

  // Load products and recent searches on init
  Future<void> loadSearchData() async {
    emit(SearchLoading());
    final result = await productsRepo
        .getProducts(); // Fetch all products for search
    result.fold((failure) => emit(SearchFailure(errMessage: failure.message)), (
      products,
    ) {
      _allProducts = products;
      _recentSearches = Prefs.getStringList('recentSearches') ?? [];
      emit(
        SearchLoaded(products: _allProducts, recentSearches: _recentSearches),
      );
    });
  }

  // Search and filter products
  void searchProducts(String query) {
    if (query.isEmpty) {
      emit(
        SearchLoaded(products: _allProducts, recentSearches: _recentSearches),
      );
      return;
    }
    final filtered = _allProducts
        .where(
          (product) => product.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    if (filtered.isNotEmpty) {
      _addToRecentSearches(query);
    }
    emit(SearchLoaded(products: filtered, recentSearches: _recentSearches));
  }

  // Add to recent searches
  void _addToRecentSearches(String query) {
    if (!_recentSearches.contains(query)) {
      _recentSearches.insert(0, query);
      if (_recentSearches.length > 5)
        _recentSearches.removeLast(); // Limit to 5
      Prefs.setStringList('recentSearches', _recentSearches);
    }
  }

  // Clear recent searches
  void clearRecentSearches() {
    _recentSearches.clear();
    Prefs.setStringList('recentSearches', _recentSearches);
    emit(SearchLoaded(products: _allProducts, recentSearches: _recentSearches));
  }
}
