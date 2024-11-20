import 'package:flutter/cupertino.dart';
import 'package:flux_store/src/ui/bottom_navigation_bar_screen_view.dart';
import 'package:flux_store/src/ui/login_system/sign_in_screen_view.dart';
import 'package:flux_store/src/ui/login_system/sign_up_screen_view.dart';
import 'package:flux_store/src/ui/onboarding_screen.dart';
import 'package:flux_store/src/ui/splash_screen.dart';

import '../../ui/home_screen_view.dart';
import '../../ui/login_system/create_new_password_screen_view.dart';
import '../../ui/login_system/forget_password_screen_view.dart';
import '../../ui/login_system/forget_password_verification_screen_view.dart';

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
      };
}
