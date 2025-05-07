import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/logic/add_to_cart_product_cubit/add_to_cart_product_screen_cubit.dart';
import 'package:flux_store/src/packages/helper/helper_function.dart';
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
    final dark = HelperFunction.isDarkMode(context);
    final theme = Theme.of(context).textTheme;
    return BlocBuilder<AddToCartProductScreenCubit, AddToCartProductScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: dark ? Color(0xff23262F) : Color(0xffFFFFFF),
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
                CartProductContainerWidget(
                  productImage: ImagePath.modelImage2,
                  productName: "Sportswear Set",
                  productPrice: 80,
                  productColor: "Color:Cream",
                  productSize: "Size: L",
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}

class CartProductContainerWidget extends StatefulWidget {
  const CartProductContainerWidget({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productSize,
    required this.productColor,
    required this.productPrice,
  });

  final String productImage;
  final String productName;
  final String productSize;
  final String productColor;
  final double productPrice;

  @override
  State<CartProductContainerWidget> createState() => _CartProductContainerWidgetState();
}

class _CartProductContainerWidgetState extends State<CartProductContainerWidget> {
  bool isSelectedBox = false;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
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
          // product image
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.productImage), fit: BoxFit.fill),

                //                        color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),
          ),

          // product details
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                //color: Colors.red,
              ),
              child: Row(
                children: [
                  // basic info
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.productName, style: theme.titleSmall),
                          Gap(10),
                          Text("\u0024${widget.productPrice.toStringAsFixed(0)}", style: theme.titleSmall),
                          Gap(10),
                          Text(
                            "${widget.productSize} | ${widget.productColor}",
                            style: theme.titleSmall?.copyWith(fontSize: 10, color: Color(0xff8A8A8F)),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // product quantity
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Checkbox(
                            side: BorderSide.none,
                            fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return Color(0xff508A7B);
                              }
                              return Colors.grey; // Grey when unselected
                            }),
                            value: isSelectedBox,
                            onChanged: (value) {
                              setState(() {
                                isSelectedBox = !isSelectedBox;
                              });
                            },
                          ),

                          // product quantity
                          Container(
                            alignment: AlignmentDirectional.center,
                            height: 28,
                            width: 80,
                            decoration: BoxDecoration(border: Border.all(color: dark ? Colors.white : Colors.black), borderRadius: BorderRadius.circular(20)),
                            child: OverflowBox(
                              maxWidth: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(onPressed: () {}, icon: Icon(Icons.remove, size: 14)),
                                  Text(
                                    "1",
                                    style: theme.titleSmall?.copyWith(fontSize: 10),
                                  ),
                                  IconButton(onPressed: () {}, icon: Icon(Icons.add, size: 14)),
                                ],
                              ),
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
