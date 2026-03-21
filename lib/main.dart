import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/providers/theme_provider.dart';
import 'package:e_coomerce_fruit/core/services/custom_bloc_observer.dart';
import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/core/services/shared_preferences_singleton.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
import 'package:e_coomerce_fruit/core/utils/connectivity_banner_network.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/cubits/cart_cubit/cart_cubit.dart';
import 'package:e_coomerce_fruit/firebase_options.dart';
import 'package:e_coomerce_fruit/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Prefs.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  setupGetIt();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: BlocProvider(
        create: (context) => CartCubit(),
        child: const FruitsHub(),
      ),
    ),
  );
}

class FruitsHub extends StatelessWidget {
  const FruitsHub({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeProvider>().isDark;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: ConnectivityBanner(
        child: MaterialApp.router(
          locale: const Locale('ar'),

          theme: ThemeData(
            fontFamily: 'Cario',
            scaffoldBackgroundColor: AppColors.backgroundColor,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryColor,
              brightness: Brightness.light,
              primary: AppColors.primaryColor,
              secondary: AppColors.secondryColor,
              error: AppColors.errorColor,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.backgroundColor,
              foregroundColor: AppColors.primaryTextColor,
              elevation: 0,
              centerTitle: true,
            ),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: AppColors.primaryTextColor),
              bodyMedium: TextStyle(color: AppColors.primaryTextColor),
              bodySmall: TextStyle(color: AppColors.secondaryTextColor),
              titleLarge: TextStyle(color: AppColors.primaryTextColor),
              titleMedium: TextStyle(color: AppColors.primaryTextColor),
              titleSmall: TextStyle(color: AppColors.secondaryTextColor),
            ),
            cardColor: AppColors.cardColor,
            dividerColor: AppColors.borderColor,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                side: const BorderSide(color: AppColors.primaryColor),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.borderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
          darkTheme: ThemeData(
            fontFamily: 'Cario',
            scaffoldBackgroundColor: Colors.black,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryColor,
              brightness: Brightness.dark,
            ),
            brightness: Brightness.dark,
          ),
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          routerConfig: AppRouter.router,
          title: 'ALWADI GO',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        ),
      ),
    );
  }
}
