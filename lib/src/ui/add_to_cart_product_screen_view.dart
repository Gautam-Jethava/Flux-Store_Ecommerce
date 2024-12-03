import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/logic/add_to_cart_product_cubit/add_to_cart_product_screen_cubit.dart';
import 'package:flux_store/src/utils/constants/image_path.dart';
import 'package:gap/gap.dart';

import '../components/back_to_previous_screen_btn_widget.dart';

class AddToCartProductScreenView extends StatelessWidget {
  static String routeName = "/AddToCartProductScreenView";

  const AddToCartProductScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToCartProductScreenCubit(),
      child: AddToCartProductScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                const BackToPreviousScreenBtn(),
                const Gap(110),
                Text(
                  "Your cart",
                  style: theme.headlineSmall,
                ),
              ],
            ),
            Gap(20),
            CartProductContainerWidget(),
          ],
        ),
      )),
    );
  }
}

class CartProductContainerWidget extends StatelessWidget {
  const CartProductContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      alignment: AlignmentDirectional.center,
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 1,
          blurStyle: BlurStyle.outer,
          offset: const Offset(0.1, 0.4),
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(ImagePath.modelImage2), fit: BoxFit.fill),

                //                        color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
//                color: Colors.red,

                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                //color: Colors.red,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sportswear Set", style: theme.titleSmall),
                          Gap(10),
                          Text("\u002480", style: theme.titleSmall),
                          Gap(10),
                          Text(
                            "Size: L | Color:Cream",
                            style: theme.titleSmall?.copyWith(fontSize: 10, color: Color(0xff8A8A8F)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),

                          // product quantity
                          Container(
                            alignment: AlignmentDirectional.center,
                            height: 22,
                            width: 70,
                            decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.remove, size: 10))),
                                Expanded(
                                  child: Text(
                                    "1",
                                    style: theme.titleSmall?.copyWith(fontSize: 10),
                                  ),
                                ),
                                Expanded(child: IconButton(onPressed: () {}, icon: Icon(Icons.add, size: 10))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
