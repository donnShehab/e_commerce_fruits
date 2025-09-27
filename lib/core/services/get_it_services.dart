
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/firebase_auth_services.dart';
import 'package:fruit_hub/core/services/firestore_service.dart';
import 'package:fruit_hub/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_hub/feature/auth/domain/repos/auth_repos.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  print("Registering services...");
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DataBaseService>(FirestoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthServices: getIt<FirebaseAuthService>(),
      dataBaseService: getIt<DataBaseService>(),
    ),
  );
}
