import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/logic/login_system_cubit/forget_password_cubit/forget_password_screen_cubit.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../../components/back_to_previous_screen_btn_widget.dart';
import '../../components/elevated_btn.dart';
import '../../packages/helper/helper_function.dart';
import 'create_new_password_screen_view.dart';

class ForgetPasswordVerificationScreenView extends StatelessWidget {
  static String routeName = "/ForgetPasswordVerificationScreenView";

  const ForgetPasswordVerificationScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordScreenCubit(),
      child: const ForgetPasswordVerificationScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackToPreviousScreenBtn(),
              const Gap(40),
              Text(
                "Verification code",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Gap(30),
              Text(
                "Please enter the verification code we sent to your email address",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Gap(40),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 60,
                  width: 300,
                  child: Pinput(
                    length: 4,
                    autofocus: true,
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    defaultPinTheme: PinTheme(
                      width: 58,
                      height: 268,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: dark ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              const Gap(40),
              Align(
                alignment: AlignmentDirectional.center,
                child: ElevatedBtn(
                  onTap: () => context.screenNavigateToNamed(CreateNewPasswordScreenView.routeName),
                  height: 51,
                  width: 146,
                  backgroundColor: dark ? Colors.white : Colors.black,
                  radius: 130,
                  isBorderBtn: false,
                  text: "Verify",
                  textColor: dark ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
