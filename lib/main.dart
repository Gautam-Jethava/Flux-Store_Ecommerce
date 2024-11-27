import 'package:flutter/material.dart';
import 'package:flux_store/src/app/route/app_route.dart';
import 'package:flux_store/src/ui/splash_screen.dart';
import 'package:flux_store/src/utils/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await Supabase.initialize(
      url: 'https://oipvlycmbdbthmnxraiy.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9pcHZseWNtYmRidGhtbnhyYWl5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzIxNjQ5MDcsImV4cCI6MjA0Nzc0MDkwN30.4cgPnGrAOPDXYOGwp64PncsOt8Jao5WNR3Jai6FpOis');

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
