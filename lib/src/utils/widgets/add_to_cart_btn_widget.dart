import 'package:flutter/material.dart';
import 'package:flux_store/src/ui/add_to_cart_product_screen_view.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../packages/helper/helper_function.dart';

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
      child: GestureDetector(
        onTap: () {
          context.screenNavigateToNamed(AddToCartProductScreenView.routeName);
        },
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
                style: theme.titleMedium?.copyWith(color: dark ? Colors.black : Colors.white, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
