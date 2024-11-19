import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../packages/helper/helper_function.dart';
import '../packages/resources/text_field_style.dart';
import '../packages/resources/text_field_validator.dart';
import 'elevated_btn.dart';

class SignUpFromWidget extends StatelessWidget {
  const SignUpFromWidget({
    super.key,
    this.signUpEvent,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.globalKey,
  });

  final void Function()? signUpEvent;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> globalKey;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Form(
      key: globalKey,
      child: Column(
        children: [
          CustomTextFieldStyle(
            fieldController: nameController,
            fieldName: "Enter your name",
            autoFocus: false,
            obscureText: false,
            validator: (value) => InputValidator.textFieldValidator(FieldType.userName, value),
          ),
          const Gap(20),
          CustomTextFieldStyle(
            fieldController: emailController,
            fieldName: "Email Address",
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
          const Gap(20),
          CustomTextFieldStyle(
            fieldController: confirmPasswordController,
            fieldName: "Confirm Password",
            autoFocus: false,
            obscureText: false,
            validator: (value) => InputValidator.textFieldValidator(FieldType.confirmPassword, value),
          ),
          const Gap(40),
          Align(
            alignment: AlignmentDirectional.center,
            child: ElevatedBtn(
              onTap: signUpEvent,
              height: 51,
              width: 146,
              backgroundColor: dark ? Colors.white : Colors.black,
              radius: 130,
              isBorderBtn: false,
              text: "SIGN UP",
              textColor: dark ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
