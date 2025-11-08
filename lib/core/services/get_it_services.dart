import 'package:e_coomerce_fruit/core/repos/images_repo/images_repo.dart';
import 'package:e_coomerce_fruit/core/repos/images_repo/images_repo_impl.dart';
import 'package:e_coomerce_fruit/core/repos/order_repo/order_repo.dart';
import 'package:e_coomerce_fruit/core/repos/order_repo/order_repo_impl.dart';
import 'package:e_coomerce_fruit/core/repos/product_repo/product_repo_impl.dart';
import 'package:e_coomerce_fruit/core/repos/product_repo/products_repo.dart';
import 'package:e_coomerce_fruit/core/services/database_service.dart';
import 'package:e_coomerce_fruit/core/services/firebase_auth_services.dart';
import 'package:e_coomerce_fruit/core/services/firestore_service.dart';
import 'package:e_coomerce_fruit/core/services/storage_service.dart';
import 'package:e_coomerce_fruit/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:e_coomerce_fruit/feature/auth/domain/repos/auth_repos.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  print("Registering services...");
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DataBaseService>(FirestoreService());
  getIt.registerSingleton<StorageService>(StorageService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthService>(),
      dataBaseService: getIt<DataBaseService>(),
    ),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(getIt<DataBaseService>()),
  );
  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(getIt<StorageService>()));
  getIt.registerSingleton<OrderRepo>(OrderRepoImpl(getIt<DataBaseService>()));
}
