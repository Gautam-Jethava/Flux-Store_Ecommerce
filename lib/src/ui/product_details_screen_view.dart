import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/utils/constants/image_path.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';

import '../logic/product_details_cubit/product_details_screen_cubit.dart';
import '../packages/helper/helper_function.dart';

class ProductDetailsScreenView extends StatelessWidget {
  static String routeName = "/ProductDetailsScreenView";

  const ProductDetailsScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsScreenCubit(),
      child: const ProductDetailsScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Positioned(
                  top: 100,
                  left: 60,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Color(0xffE7C0A7),
                  ),
                ),
                Container(
                  height: 532,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(ImagePath.modelImage18)),
                  ),
                ),
                Positioned(
                  top: 10,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: dark ? Colors.black : Colors.white,
                        child: IconButton(onPressed: () => context.screenPop(), icon: const Icon(CupertinoIcons.back)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
