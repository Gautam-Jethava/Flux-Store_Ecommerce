import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/components/elevated_btn.dart';
import 'package:flux_store/src/logic/splash_screen_cubit/splash_screen_cubit.dart';
import 'package:flux_store/src/packages/helper/helper_function.dart';
import 'package:flux_store/src/ui/onboarding_screen.dart';
import 'package:flux_store/src/utils/constants/image_path.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';
import 'package:gap/gap.dart';

import '../utils/constants/app_size.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/";

  const SplashScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenCubit()..startTimer(context),
      child: const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return BlocBuilder<SplashScreenCubit, SplashScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.black26.withOpacity(0.1),
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(ImagePath.splashImage), fit: BoxFit.cover)),
                ),
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                ),
                Positioned(
                  left: 50,
                  top: 540,
                  child: SizedBox(
                    height: 200,
                    width: 300,
                    child: Column(
                      children: [
                        Text(
                          "Welcome to Fluxstore! ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: dark ? Colors.white : Colors.white),
                        ),
                        const Gap(10),
                        Text(
                          "The home for a fashionista",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: dark ? Colors.white : Colors.white),
                        ),
                        const Gap(30),
                        ElevatedBtn(
                          text: "Get Started",
                          textColor: Colors.white,
                          height: 48,
                          width: 200,
                          backgroundColor: Colors.grey,
                          radius: 100,
                          isBorderBtn: true,
                          borderColor: Colors.white,
                          onTap: () {
                            context.screenNavigateToNamed(OnboardingScreen.routeName);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
