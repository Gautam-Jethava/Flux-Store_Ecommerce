import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/components/elevated_btn.dart';
import 'package:flux_store/src/logic/onboarding_screen_cubit/onboarding_cubit.dart';
import '../components/custom_page_indicator_widget.dart';
import '../components/onboarding_widget.dart';
import '../utils/constants/image_path.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = "/OnboardingScreen";

  const OnboardingScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit()..updateIndex(0),
      child: const OnboardingScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final page = [
      OnboardingWidget(
        title: "Discover something new",
        subTitle: "Special new arrivals just for you",
        image: ImagePath.onBoardingImage1,
      ),
      OnboardingWidget(
        title: "Update trendy outfit",
        subTitle: "Favorite brands and hottest trends",
        image: ImagePath.onBoardingImage2,
      ),
      OnboardingWidget(
        title: "Explore your true style",
        subTitle: "Relax and let us bring the style to you",
        image: ImagePath.onBoardingImage3,
      ),
    ];
    final controller = PageController();
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                controller: controller,
                itemCount: page.length,
                onPageChanged: (index) {
                  context.read<OnboardingCubit>().updateIndex(index);
                },
                itemBuilder: (context, index) {
                  return page[index];
                },
              ),
              Positioned(
                bottom: 80,
                left: 100,
                child: ElevatedBtn(
                  text: "Shopping now",
                  height: 48,
                  width: 200,
                  backgroundColor: Colors.grey,
                  radius: 100,
                  isBorderBtn: true,
                  borderColor: Colors.white,
                  onTap: () {
                    if (state.currentIndex < page.length - 1) {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      //Navigator.pushNamed(context, HomeScreen.routeName);
                    }
                  },
                ),
              ),
              Positioned(
                bottom: 180,
                left: 0,
                right: 0,
                child: Center(
                  child: CustomPageIndicatorWidget(
                    currentPage: state.currentIndex,
                    pageCount: page.length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
