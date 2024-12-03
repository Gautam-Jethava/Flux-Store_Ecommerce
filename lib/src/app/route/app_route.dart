import 'package:flutter/cupertino.dart';
import 'package:flux_store/src/ui/bottom_navigation_bar_screen_view.dart';
import 'package:flux_store/src/ui/login_system/sign_in_screen_view.dart';
import 'package:flux_store/src/ui/login_system/sign_up_screen_view.dart';
import 'package:flux_store/src/ui/onboarding_screen.dart';
import 'package:flux_store/src/ui/splash_screen.dart';

import '../../ui/add_to_cart_product_screen_view.dart';
import '../../ui/home_screen_view.dart';
import '../../ui/login_system/create_new_password_screen_view.dart';
import '../../ui/login_system/forget_password_screen_view.dart';
import '../../ui/login_system/forget_password_verification_screen_view.dart';
import '../../ui/product_details_screen_view.dart';
import '../../ui/search_product_found_screen_view.dart';
import '../../ui/search_view_screen.dart';

class AppRoute {
  static Map<String, WidgetBuilder> get screens => <String, WidgetBuilder>{
        SplashScreen.routeName: SplashScreen.builder,
        OnboardingScreen.routeName: OnboardingScreen.builder,
        SignUpScreenView.routeName: SignUpScreenView.builder,
        SignInScreenView.routeName: SignInScreenView.builder,
        ForgetPasswordScreenView.routeName: ForgetPasswordScreenView.builder,
        ForgetPasswordVerificationScreenView.routeName: ForgetPasswordVerificationScreenView.builder,
        CreateNewPasswordScreenView.routeName: CreateNewPasswordScreenView.builder,
        HomeScreenView.routeName: HomeScreenView.builder,
        BottomNavigationBarScreenView.routeName: BottomNavigationBarScreenView.builder,
        SearchScreenView.routeName: SearchScreenView.builder,
        SearchProductFoundScreenView.routeName: SearchProductFoundScreenView.builder,
        ProductDetailsScreenView.routeName: ProductDetailsScreenView.builder,
        AddToCartProductScreenView.routeName: AddToCartProductScreenView.builder,
      };
}
