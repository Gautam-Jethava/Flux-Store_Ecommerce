import 'package:flutter/material.dart';
import 'package:flux_store/src/app/route/app_route.dart';
import 'package:flux_store/src/ui/splash_screen.dart';
import 'package:flux_store/src/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute.screens,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: SplashScreen.routeName,
    );
  }
}
