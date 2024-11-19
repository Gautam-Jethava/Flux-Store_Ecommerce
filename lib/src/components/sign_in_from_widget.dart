import 'package:flutter/material.dart';
import 'package:flux_store/src/components/signin_signup_widget.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';
import 'package:gap/gap.dart';

import '../packages/helper/helper_function.dart';
import '../packages/resources/text_field_style.dart';
import '../packages/resources/text_field_validator.dart';
import '../ui/login_system/forget_password_screen_view.dart';
import 'elevated_btn.dart';

class SignInFromWidget extends StatelessWidget {
  const SignInFromWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.signInEvent,
    required this.globalKey,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function()? signInEvent;
  final GlobalKey<FormState> globalKey;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Form(
      key: globalKey,
      child: Column(
        children: [
          CustomTextFieldStyle(
            fieldController: emailController,
            fieldName: "Enter Email",
            autoFocus: false,
            obscureText: false,
            validator: (value) => InputValidator.textFieldValidator(FieldType.email, value),
          ),
          const Gap(20),
          CustomTextFieldStyle(
            fieldController: passwordController,
            fieldName: "Password",
            autoFocus: false,
            obscureText: false,
            validator: (value) => InputValidator.textFieldValidator(FieldType.password, value),
          ),
          const Gap(30),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () => context.screenNavigateToNamed(ForgetPasswordScreenView.routeName),
                child: Text(
                  "Forget Password",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
          ),
          const Gap(40),
          Align(
            alignment: AlignmentDirectional.center,
            child: ElevatedBtn(
              onTap: signInEvent,
              height: 51,
              width: 146,
              backgroundColor: dark ? Colors.white : Colors.black,
              radius: 130,
              isBorderBtn: false,
              text: "LOG IN",
              textColor: dark ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
