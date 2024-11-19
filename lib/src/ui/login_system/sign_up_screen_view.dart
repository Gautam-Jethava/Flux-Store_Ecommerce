import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/logic/login_system_cubit/sign_up_cubit/sign_up_screen_cubit.dart';
import 'package:flux_store/src/ui/login_system/sign_in_screen_view.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';
import '../../components/sign_up_from_widget.dart';
import '../../components/signin_signup_widget.dart';

class SignUpScreenView extends StatelessWidget {
  static String routeName = "/SignUpScreenView";

  const SignUpScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpScreenCubit(),
      child: const SignUpScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: SignInSignUpWidget(
              otherAuthNav: () {
                context.screenNavigateToNamed(SignInScreenView.routeName);
              },
              topTitle: "Create\n\n",
              topSubTitle: "your account",
              textFieldForm: SignUpFromWidget(
                globalKey: globalKey,
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                signUpEvent: () {},
              ),
              otherOptionsText: "or sign up with",
              haveAccount: "Already have account?  ",
              haveAccountOrNot: "Log In",
              space1: 30,
              space2: 30,
              space3: 30,
              space4: 40,
            ),
          ),
        ),
      ),
    );
  }
}
