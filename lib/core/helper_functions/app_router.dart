import 'package:fruit_hub/feature/auth/presntation/views/adding_product_view.dart';
import 'package:fruit_hub/feature/auth/presntation/views/forget_password_view.dart';
import 'package:fruit_hub/feature/auth/presntation/widgwts/home_view_body.dart';
import 'package:fruit_hub/feature/auth/presntation/views/more_product_view.dart';
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
  static const kHome = '/Home';
  static const kAddingProductView = '/AddingProductView';
  static const kMoreProductView = '/MoreProductView';
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
      GoRoute(path: kHome, builder: (context, state) => HomeView()),
      GoRoute(
        path: kAddingProductView,
        builder: (context, state) => AddingProductView(),
      ),
      GoRoute(
        path: kMoreProductView,
        builder: (context, state) => MoreProductView(),
      ),
    ],
  );
}
