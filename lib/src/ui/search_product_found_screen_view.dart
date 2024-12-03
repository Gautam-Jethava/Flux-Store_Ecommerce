import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flux_store/src/logic/search_product_found_cubit/search_product_found_screen_cubit.dart';
import 'package:flux_store/src/ui/product_details_screen_view.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';
import 'package:gap/gap.dart';

import '../components/back_to_previous_screen_btn_widget.dart';
import '../packages/helper/helper_function.dart';
import '../utils/widgets/favourite_product_icon_widget.dart';

class SearchProductFoundScreenView extends StatelessWidget {
  static String routeName = "/SearchProductFoundScreenView";

  const SearchProductFoundScreenView({super.key, required this.foundedItemName});

  final String foundedItemName;

  static Widget builder(BuildContext context) {
    String productName = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => SearchProductFoundScreenCubit(),
      child: SearchProductFoundScreenView(
        foundedItemName: productName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String productName = ModalRoute.of(context)!.settings.arguments as String;
    final theme = Theme.of(context).textTheme;
    final cubit = context.read<SearchProductFoundScreenCubit>();
    List<String> options = <String>['Filter', 'Low to High', 'High to Low', 'Discount'];
    String dropdownValue = 'Filter';
    final dark = HelperFunction.isDarkMode(context);
    return BlocBuilder<SearchProductFoundScreenCubit, SearchProductFoundScreenState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const BackToPreviousScreenBtn(),
                      const Gap(20),
                      Text(
                        productName.capitalize(),
                        style: theme.titleMedium,
                      )
                    ],
                  ),
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Found \n152 Results",
                        style: theme.titleLarge,
                      ),
                      Container(
                        height: 40,
                        width: 98,
                        decoration: BoxDecoration(
                          color: dark ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 3, color: dark ? const Color(0xff33302E).withOpacity(0.6) : const Color(0xffB6B6B6)),
                        ),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          items: options.map<DropdownMenuItem<String>>((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          underline: const SizedBox(),
                          onChanged: (value) {},
                          isExpanded: true,
                          selectedItemBuilder: (context) {
                            return options.map((e) {
                              return Center(
                                child: Text(
                                  dropdownValue,
                                ),
                              );
                            }).toList();
                          },
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Expanded(
                    flex: 8,
                    child: SizedBox(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 0.5),
                        itemCount: cubit.resultsProductList.length,
                        itemBuilder: (context, index) {
                          final searchProductItem = cubit.resultsProductList[index];
                          return Stack(
                            children: [
                              GestureDetector(
                                onTap: () => context.screenNavigateToNamed(ProductDetailsScreenView.routeName),
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  height: 200,
                                  width: 142,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(image: AssetImage(searchProductItem['image']), fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                child: SizedBox(
                                  height: 100,
                                  width: 142,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Gap(10),
                                      Text(
                                        searchProductItem['title'],
                                        style: theme.labelSmall,
                                      ),
                                      const Gap(10),
                                      Row(
                                        children: [
                                          Text(searchProductItem['price']),
                                          const Gap(10),
                                          Text(
                                            searchProductItem['realAmount'],
                                            style: theme.titleSmall?.copyWith(
                                                decoration: TextDecoration.lineThrough, color: dark ? const Color(0xffE6E8EC) : const Color(0xffBEBFC4)),
                                          ),
                                        ],
                                      ),
                                      const Gap(10),
                                      Row(
                                        children: [
                                          RatingStars(
                                            value: searchProductItem['rating'],
                                            starSize: 10,
                                            valueLabelVisibility: false,
                                          ),
                                          const Gap(10),
                                          Text("(${searchProductItem['totalReview'].toString()})"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Positioned(
                                top: 16,
                                right: 30,
                                child: FavouriteProductIconWidget(),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

/*
create social media bot for user
like when every user have birthday so their fav celebrity voice in bot can wise you and 
 */
