import 'package:fruit_hub/feature/best_selling_fruit/presntation/view/best_selling_fruit_view.dart';
import 'package:fruit_hub/feature/home/presntation/views/widgets/best_selling_grid_view.dart';
import 'package:fruit_hub/feature/auth/presntation/views/forget_password_view.dart';
import 'package:fruit_hub/feature/home/presntation/views/home_view.dart';
import 'package:fruit_hub/feature/auth/presntation/views/otp_password_view.dart';
import 'package:fruit_hub/feature/auth/presntation/views/sigin_view.dart';
import 'package:fruit_hub/feature/auth/presntation/views/signup_view.dart';
import 'package:fruit_hub/feature/on_boarding/presntation/view/on_boarding_view.dart';
import 'package:fruit_hub/feature/splash/presntation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kSplashView = '/SplashView';
  static const kOnboarding = '/OnBoardingView';
  static const kSigninView = '/SigninView';
  static const kSignupView = '/SignupView';
  static const kForgetPassword = '/ForgetPassword';
  static const kOtpPassword = '/OtpPassword';
  static const kHomeView = '/HomeView';
  static const kAddingProductView = '/AddingProductView';
  static const kMoreProductView = '/MoreProductView';
  static const kBestSellingGridView = '/BestSellingGridView';
  static const kBestSellingFruitView = '/BestSellingFruitView';
  static final router = GoRouter(
    initialLocation: kSplashView,
    routes: [
      GoRoute(path: kSplashView, builder: (context, state) => SplashView()),
      GoRoute(path: kOnboarding, builder: (context, state) => OnBoardingView()),
      GoRoute(path: kSigninView, builder: (context, state) => SigninView()),
      GoRoute(path: kSignupView, builder: (context, state) => SignupView()),
      GoRoute(
        path: kForgetPassword,
        builder: (context, state) => ForgetPasswordView(),
      ),
      GoRoute(
        path: kOtpPassword,
        builder: (context, state) => OtpPasswordView(),
      ),
      GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
      // GoRoute(
      //   path: kAddingProductView,
      //   builder: (context, state) => AddingProductView(),
      // ),

      // GoRoute(
      //   path: kMoreProductView,
      //   builder: (context, state) => MoreProductView(),
      // ),
      GoRoute(
        path: kBestSellingGridView,
        builder: (context, state) => BestSellingGridView(),
      ),
      GoRoute(
        path: kBestSellingFruitView,
        builder: (context, state) => BestSellingFruitView(),
      ),
    ],
  );
}
