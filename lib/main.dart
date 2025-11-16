import 'package:e_coomerce_fruit/core/helper_functions/app_router.dart';
import 'package:e_coomerce_fruit/core/providers/theme_provider.dart';
import 'package:e_coomerce_fruit/core/services/custom_bloc_observer.dart';
import 'package:e_coomerce_fruit/core/services/get_it_services.dart';
import 'package:e_coomerce_fruit/core/services/shared_preferences_singleton.dart';
import 'package:e_coomerce_fruit/core/utils/app_colors.dart';
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
      
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider())
        
        
        ]
      
      ,
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

    return MaterialApp.router(
      locale: const Locale('ar'),
     
      theme: ThemeData(
        fontFamily: 'Cario',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        brightness: Brightness.light,
        // أي تخصيص إضافي للثيم الفاتح
      ),
      darkTheme: ThemeData(
        fontFamily: 'Cario',
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor, brightness: Brightness.dark),
        brightness: Brightness.dark,
        // أي تخصيص إضافي للثيم الداكن (ألوان نص، خلفيات، إلخ)
      ),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      routerConfig: AppRouter.router,
      title: 'Fruits Hub',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
