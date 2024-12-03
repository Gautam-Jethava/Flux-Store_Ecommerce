import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';

import '../logic/product_details_cubit/product_details_screen_cubit.dart';
import '../packages/helper/helper_function.dart';
import '../utils/constants/image_path.dart';
import '../utils/widgets/add_to_cart_btn_widget.dart';
import '../utils/widgets/favourite_product_icon_widget.dart';
import '../utils/widgets/product_image_dot_widget.dart';
import '../utils/widgets/product_info_details_widget.dart';

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
      //add to cart btn
      bottomNavigationBar: const AddToCartBtnWidget(),
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              top: 70,
              left: 100,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Color(0xffE7C0A7),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: () {
                  context.screenPop();
                },
                icon: Icon(
                  CupertinoIcons.back,
                  color: dark ? Colors.white : Colors.black,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: dark ? Colors.black : Colors.white,
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ),
            const Positioned(
              top: 10,
              right: 30,
              child: FavouriteProductIconWidget(),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 800,
              width: double.infinity,
              child: SizedBox(
                height: 500,
                width: double.infinity,
                child: Image.asset(ImagePath.modelImage18),
              ),
            ),
            const Positioned(
              left: 170,
              top: 380,
              child: SizedBox(
                height: 20,
                width: 60,
                child: ProductImageDotWidget(),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: ProductInfoDetailsWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

/*

  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      //add to cart btn
      bottomNavigationBar: const AddToCartBtnWidget(),
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              top: 70,
              left: 100,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Color(0xffE7C0A7),
              ),
            ),
            Positioned(
              top: 10,
              left: 30,
              child: IconButton(
                onPressed: () {
                  context.screenPop();
                },
                icon: Icon(
                  CupertinoIcons.back,
                  color: dark ? Colors.white : Colors.black,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: dark ? Colors.black : Colors.white,
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ),
            const Positioned(
              top: 10,
              right: 30,
              child: FavouriteProductIconWidget(),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 800,
              width: double.infinity,
              child: SizedBox(
                height: 500,
                width: double.infinity,
                child: Image.asset(ImagePath.modelImage18),
              ),
            ),
            const Positioned(
              left: 160,
              top: 380,
              child: SizedBox(
                height: 20,
                width: 60,
                child: ProductImageDotWidget(),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: ProductInfoDetailsWidget(),
            ),
          ],
        ),
      ),
    );
  }
 */
