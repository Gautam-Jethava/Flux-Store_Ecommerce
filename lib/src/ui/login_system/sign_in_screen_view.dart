import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/logic/login_system_cubit/sign_in_cubit/sign_in_screen_cubit.dart';
import 'package:flux_store/src/ui/login_system/sign_up_screen_view.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';
import '../../components/sign_in_from_widget.dart';
import '../../components/signin_signup_widget.dart';

class SignInScreenView extends StatelessWidget {
  static String routeName = "/SignInScreenView";

  const SignInScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInScreenCubit(),
      child: const SignInScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocBuilder<SignInScreenCubit, SignInScreenState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: SignInSignUpWidget(
                  otherAuthNav: () {
                    context.screenNavigateToNamed(SignUpScreenView.routeName);
                  },
                  topTitle: "Log into\n\n",
                  topSubTitle: "your account",
                  textFieldForm: SignInFromWidget(
                    emailController: emailController,
                    passwordController: passwordController,
                    globalKey: globalKey,
                    signInEvent: () {
                      // if (globalKey.currentState!.validate()) {
                      //   context.read<SignInScreenCubit>().signInWithEmailAndPasswordSupabase(
                      //         emailController.text.trim(),
                      //         passwordController.text.trim(),
                      //       );
                      // }
                    },
                  ),
                  otherOptionsText: "or Log in with",
                  haveAccount: "Don’t have an account?  ",
                  haveAccountOrNot: "Sign Up",
                  space1: 60,
                  space2: 30,
                  space3: 60,
                  space4: 40,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
