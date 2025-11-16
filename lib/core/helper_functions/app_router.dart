import 'package:e_coomerce_fruit/core/entities/product_entity.dart';
import 'package:e_coomerce_fruit/core/helper_functions/get_dummy_product.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/views/forget_password_view.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/views/otp_password_view.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/views/sigin_view.dart';
import 'package:e_coomerce_fruit/feature/auth/presntation/views/signup_view.dart';
import 'package:e_coomerce_fruit/feature/best_selling_fruit/presntation/view/best_selling_fruit_view.dart';
import 'package:e_coomerce_fruit/feature/checkout/presntation/views/checkout_view.dart';
import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_entity.dart';
import 'package:e_coomerce_fruit/feature/home/domain/entites/cart_item_entity.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/main_view.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/profile_view.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/reviews_view.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/search_view.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/about_us.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/best_selling_grid_view.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/personal_info_view.dart';
import 'package:e_coomerce_fruit/feature/home/presntation/views/widgets/product_view_details.dart';
import 'package:e_coomerce_fruit/feature/on_boarding/presntation/view/on_boarding_view.dart';
import 'package:e_coomerce_fruit/feature/splash/presntation/views/splash_view.dart';
import 'package:flutter/material.dart';
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
  static const kCheckout = '/Checkout';
  static const kSearchView = '/SearchView';
  static const kPersonalInfoView = '/PersonalInfoView';
  static const kAboutUs = '/AboutUs';
  static const kProductViewDetails = '/ProductViewDetails';
  static const kReviewsView = '/ReviewsView';
static const kProfileView = '/ProfileView';
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
      GoRoute(path: kHomeView, builder: (context, state) => MainView()),
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
        builder: (context, state) =>
            ProductsGridView(products: getDummyProducts()),
      ),
      GoRoute(
        path: kBestSellingFruitView,
        builder: (context, state) => BestSellingFruitView(),
      ),
      GoRoute(
        path: kCheckout,
        builder: (context, state) {
          final cartItems = state.extra as CartEntity;
          return CheckoutView(cartEntity: cartItems);
        },
      ),
      GoRoute(path: kSearchView, builder: (context, state) => SearchView()),
      GoRoute(
        path: kPersonalInfoView,
        builder: (context, state) => PersonalInfoView(),
      ),
      GoRoute(path: kAboutUs, builder: (context, state) => AboutUs()),
      GoRoute(
        path: kProductViewDetails,

        builder: (context, state) {
          final product = state.extra as ProductEntity; // Pass product data

          return ProductDetailView(product: product);
        },
      ),
      GoRoute(
        path: kReviewsView,
        builder: (context, state) {
          final productId = state.extra as String;
          return ReviewsView(productId: productId);
        },
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) => ProfileView(),
      )
    ],
  );
}
