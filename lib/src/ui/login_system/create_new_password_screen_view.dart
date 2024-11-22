import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flux_store/src/logic/login_system_cubit/create_new_password_cubit/create_new_password_screen_cubit.dart';
import 'package:flux_store/src/packages/resources/text_field_style.dart';
import 'package:flux_store/src/utils/constants/image_path.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';
import 'package:gap/gap.dart';

import '../../components/back_to_previous_screen_btn_widget.dart';
import '../../components/elevated_btn.dart';
import '../../packages/helper/helper_function.dart';
import '../bottom_navigation_bar_screen_view.dart';

class CreateNewPasswordScreenView extends StatefulWidget {
  static String routeName = "/CreateNewPasswordScreenView";

  const CreateNewPasswordScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNewPasswordScreenCubit(),
      child: const CreateNewPasswordScreenView(),
    );
  }

  @override
  State<CreateNewPasswordScreenView> createState() => _CreateNewPasswordScreenViewState();
}

class _CreateNewPasswordScreenViewState extends State<CreateNewPasswordScreenView> {
  bool isPassword = false;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackToPreviousScreenBtn(),
              const Gap(40),
              Text(
                "Create new password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Gap(30),
              Text(
                "Your new password must be different\n from previously used password",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Gap(40),
              CustomTextFieldStyle(
                fieldController: passwordController,
                fieldName: 'Password',
                autoFocus: false,
                obscureText: isPassword ? true : false,
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: isPassword ? const Icon(CupertinoIcons.eye_slash) : const Icon(CupertinoIcons.eye)),
              ),
              const Gap(20),
              CustomTextFieldStyle(
                fieldController: confirmPasswordController,
                fieldName: 'Confirm Password',
                autoFocus: false,
                obscureText: isPassword ? true : false,
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: isPassword ? const Icon(CupertinoIcons.eye_slash) : const Icon(CupertinoIcons.eye)),
              ),
              const Gap(40),
              Align(
                alignment: AlignmentDirectional.center,
                child: ElevatedBtn(
                  onTap: () {
                    buildShowModalBottomSheet(context);
                  },
                  height: 51,
                  width: 146,
                  backgroundColor: dark ? Colors.white : Colors.black,
                  radius: 130,
                  isBorderBtn: false,
                  text: "Confirm",
                  textColor: dark ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final dark = HelperFunction.isDarkMode(context);
        return Container(
          alignment: Alignment.bottomCenter,
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(color: const Color(0xff353945), borderRadius: BorderRadius.circular(30)),
          child: Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: [
                const Gap(20),
                Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: SvgPicture.asset(ImagePath.forgetPasswordSuccessfulImage),
                ),
                const Gap(20),
                Text(
                  "Your password has been changed",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Gap(10),
                Text(
                  "Welcome back! Discover now!",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Gap(30),
                Align(
                  alignment: AlignmentDirectional.center,
                  child: ElevatedBtn(
                    onTap: () => context.screenNavigateToNamed(BottomNavigationBarScreenView.routeName),
                    height: 51,
                    width: 200,
                    backgroundColor: dark ? Colors.white : Colors.black,
                    radius: 130,
                    isBorderBtn: false,
                    text: "HOME",
                    textColor: dark ? Colors.black : Colors.white,
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
