import 'package:flutter/cupertino.dart';
import 'package:flux_store/src/ui/onboarding_screen.dart';
import 'package:flux_store/src/ui/splash_screen.dart';

class AppRoute {
  static Map<String, WidgetBuilder> get screens => <String, WidgetBuilder>{
        SplashScreen.routeName: SplashScreen.builder,
        OnboardingScreen.routeName: OnboardingScreen.builder,
      };
}
