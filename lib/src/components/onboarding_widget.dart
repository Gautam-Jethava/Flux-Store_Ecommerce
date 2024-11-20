import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/constants/app_color.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });

  final String title;
  final String subTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: AppColor.onBoardingWidgetColor,
              ),
            ),
          ],
        ),
        Positioned(
          left: 70,
          top: 200,
          child: Container(
            height: 400,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          top: 80,
          left: 40,
          child: SizedBox(
            height: 100,
            width: 300,
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(wordSpacing: 2),
                ),
                const Gap(30),
                Text(
                  subTitle,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                )
              ],
            ),
          ),
        ),
        // Positioned(
        //   bottom: 80,
        //   left: 90,
        //   child: ElevatedBtn(
        //     text: "Shopping now",
        //     height: 48,
        //     width: 200,
        //     backgroundColor: Colors.grey,
        //     radius: 100,
        //     isBorderBtn: true,
        //     borderColor: Colors.white,
        //     onTap: () {},
        //   ),
        // ),
      ],
    );
  }
}
