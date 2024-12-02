import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../logic/product_details_cubit/product_details_screen_cubit.dart';
import '../packages/helper/helper_function.dart';
import '../utils/constants/image_path.dart';
import '../utils/widgets/favourite_product_icon_widget.dart';

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
    //final theme = Theme.of(context).textTheme;
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
                onPressed: () => Navigator.pop(context),
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
}

class ProductInfoDetailsWidget extends StatelessWidget {
  const ProductInfoDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final dark = HelperFunction.isDarkMode(context);
    return Container(
      height: 320,
      width: double.infinity,
      decoration: BoxDecoration(
        color: dark ? Colors.black : Colors.white,
        borderRadius: const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sportswear Set", style: theme.titleMedium),
                  Text("\$80.00", style: theme.titleMedium),
                ],
              ),
              const Gap(10),
              SizedBox(
                height: 14,
                width: 140,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const RatingStars(
                      value: 5,
                      valueLabelVisibility: false,
                      starColor: Color(0xff508A7B),
                    ),
                    Text(
                      "(83)",
                      style: theme.labelSmall,
                    )
                  ],
                ),
              ),
              const Gap(20),
              Divider(color: dark ? const Color(0xff23262F) : const Color(0xffF3F3F6)),
              const Gap(10),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Color",
                            style: theme.titleSmall
                                ?.copyWith(color: dark ? const Color(0xffB1B5C3) : const Color(0xff777E90)),
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 34,
                                width: 34,
                                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xffE7C0A7),
                                      boxShadow: dark
                                          ? []
                                          : [
                                              const BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 0.4,
                                                blurRadius: 0.5,
                                              )
                                            ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 34,
                                width: 34,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                    border: Border.all(
                                        color: dark ? const Color(0xff313131) : Colors.transparent, width: 2),
                                  ),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 34,
                                width: 34,
                                decoration: const BoxDecoration(shape: BoxShape.circle),
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xffEE6969),
                                    border: Border.all(
                                        color: dark ? const Color(0xff313131) : Colors.transparent, width: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Size",
                            style: theme.titleSmall
                                ?.copyWith(color: dark ? const Color(0xffB1B5C3) : const Color(0xff777E90)),
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(
                                    color: dark ? const Color(0xff23262F) : const Color(0xffFAFAFA),
                                    shape: BoxShape.circle),
                                child: const Text("S"),
                              ),
                              const Gap(10),
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: dark ? const Color(0xff23262F) : const Color(0xffFAFAFA),
                                ),
                                child: const Text("M"),
                              ),
                              const Gap(10),
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(
                                    color: dark ? const Color(0xff23262F) : const Color(0xffFAFAFA),
                                    shape: BoxShape.circle),
                                child: const Text("L"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: dark ? const Color(0xff23262F) : const Color(0xffF3F3F6)),
              const Gap(10),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text("Description"),
              //     Icon(Icons.keyboard_arrow_right_rounded),
              //   ],
              // ),
              // Divider(color: dark ? const Color(0xff23262F) : const Color(0xffF3F3F6)),
              // const Gap(10),
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [Text("Review"), Icon(Icons.keyboard_arrow_right_rounded)],
              // ),
              ExpansionTile(
                shape: Border.all(color: Colors.transparent),
                trailing: const Icon(CupertinoIcons.right_chevron),
                onExpansionChanged: (bool value) {},
                title: const Text("Description"),
              ),
              Divider(color: dark ? const Color(0xff23262F) : const Color(0xffF3F3F6)),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductImageDotWidget extends StatelessWidget {
  const ProductImageDotWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        3,
        (index) {
          int selected = 0;
          return Container(
            alignment: AlignmentDirectional.center,
            height: 12,
            width: 12,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: selected == index ? Colors.grey : Colors.transparent)),
            child: Container(
              height: 6,
              width: 6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}

class AddToCartBtnWidget extends StatelessWidget {
  const AddToCartBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final dark = HelperFunction.isDarkMode(context);
    return Container(
      color: dark ? Colors.black : Colors.white,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: dark ? Colors.white : Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(HugeIcons.strokeRoundedShoppingBasket01, color: dark ? Colors.black : Colors.white),
            const Gap(20),
            Text(
              "Add To Cart",
              style:
                  theme.titleMedium?.copyWith(color: dark ? Colors.black : Colors.white, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
