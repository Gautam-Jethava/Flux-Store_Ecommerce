import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../packages/helper/helper_function.dart';
import '../utils/constants/image_path.dart';

class SignInSignUpWidget extends StatelessWidget {
  const SignInSignUpWidget({
    super.key,
    required this.topTitle,
    required this.topSubTitle,
    required this.textFieldForm,
    required this.otherOptionsText,
    required this.haveAccount,
    required this.haveAccountOrNot,
    required this.space2,
    required this.space3,
    required this.space4,
    required this.space1,
    this.otherAuthNav,
  });

  final String topTitle;
  final String topSubTitle;
  final Widget textFieldForm;
  final String otherOptionsText;
  final String haveAccount;
  final String haveAccountOrNot;
  final double space2;
  final double space3;
  final double space4;
  final double space1;
  final void Function()? otherAuthNav;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(30),
        Text.rich(
          TextSpan(children: [
            TextSpan(text: topTitle, style: Theme.of(context).textTheme.headlineMedium),
            TextSpan(text: topSubTitle, style: Theme.of(context).textTheme.headlineMedium),
          ]),
        ),
        Gap(space1),
        textFieldForm,
        Gap(space2),
        Align(
          alignment: Alignment.center,
          child: Text(
            otherOptionsText,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        Gap(space3),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: dark ? Colors.white.withOpacity(0.4) : Colors.white,
                    border: Border.all(
                        color: dark ? Colors.transparent : const Color(0xff332218).withOpacity(0.2), width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    ImagePath.socialMediaIcon1,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: dark ? Colors.white.withOpacity(0.4) : Colors.white,
                    border: Border.all(
                        color: dark ? Colors.transparent : const Color(0xff332218).withOpacity(0.2), width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    ImagePath.socialMediaIcon2,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: dark ? Colors.white.withOpacity(0.4) : Colors.white,
                    border: Border.all(
                        color: dark ? Colors.transparent : const Color(0xff332218).withOpacity(0.2), width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    ImagePath.socialMediaIcon3,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        Gap(space4),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: otherAuthNav,
            child: Text.rich(
              TextSpan(children: [
                TextSpan(text: haveAccount, style: Theme.of(context).textTheme.titleSmall),
                TextSpan(
                    text: haveAccountOrNot,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(decoration: TextDecoration.underline)),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
