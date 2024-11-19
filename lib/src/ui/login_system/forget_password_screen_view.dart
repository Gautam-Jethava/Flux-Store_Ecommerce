import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/components/sign_in_from_widget.dart';
import 'package:flux_store/src/logic/login_system_cubit/forget_password_cubit/forget_password_screen_cubit.dart';
import 'package:flux_store/src/packages/helper/helper_function.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';
import 'package:gap/gap.dart';

import '../../components/back_to_previous_screen_btn_widget.dart';

class ForgetPasswordScreenView extends StatelessWidget {
  static String routeName = "/ForgetPasswordScreenView";

  const ForgetPasswordScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordScreenCubit(),
      child: const ForgetPasswordScreenView(),
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
              const Gap(30),
              Text(
                "Forgot password?",
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
