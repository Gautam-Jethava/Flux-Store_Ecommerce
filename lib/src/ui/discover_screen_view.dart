import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/components/back_to_previous_screen_btn_widget.dart';
import 'package:flux_store/src/components/elevated_btn.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../components/discover_collection_widget.dart';
import '../logic/discover_screen_cubit/discover_screen_cubit.dart';

class DiscoverScreenView extends StatelessWidget {
  static String routeName = "/DiscoverScreenView";

  const DiscoverScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => DiscoverScreenCubit(),
      child: const DiscoverScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverScreenCubit, DiscoverScreenState>(
      builder: (context, state) {
        return Scaffold(
          endDrawer: const CustomDrawer(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //search bar
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            height: 46,
                            width: 260,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xff23262F)),
                            child: const Row(
                              children: [Gap(20), Icon(Icons.search), Gap(20), Text("Search")],
                            ),
                          ),
                        ),

                        //filter icon
                        Container(
                          alignment: AlignmentDirectional.center,
                          height: 46,
                          width: 50,
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(10), color: const Color(0xff23262F)),
                          child: Builder(
                            builder: (BuildContext context) {
                              return IconButton(
                                  onPressed: () {
                                    Scaffold.of(context).openEndDrawer();
                                  },
                                  icon: const Icon(HugeIcons.strokeRoundedMenuSquare));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(40),
                  const Expanded(flex: 8, child: DiscoverCollectionWidget()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int? selectedRating;
  double currentValue = 10;
  double lowerValue = 10;
  double upperValue = 80;
  RangeValues currentRangeValues = const RangeValues(10, 80);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Filter",
                  style: theme.titleLarge,
                ),
                const Icon(HugeIcons.strokeRoundedMenuSquare)
              ],
            ),
            const Gap(30),
            const Divider(height: 2),
            const Gap(20),
            Text(
              "Price ",
              style: theme.titleSmall,
            ),
            RangeSlider(
              values: RangeValues(lowerValue, upperValue),
              min: 10,
              max: 100,
              activeColor: Colors.white,
              labels: RangeLabels(
                currentRangeValues.start.round().toString(),
                currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  lowerValue = values.start;
                  upperValue = values.end;
                  currentRangeValues = values;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$${currentRangeValues.start.toInt()} '),
                  Text('\$${currentRangeValues.end.toInt()} '),
                ],
              ),
            ),
            const Gap(20),
            Text(
              "Color",
              style: theme.titleSmall,
            ),
            const Gap(20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: Colors.primaries.map((color) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Gap(20),
            Text(
              "Star Rating",
              style: theme.titleSmall,
            ),
            const Gap(20),

            // rating star
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                5,
                (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRating = selectedRating == index ? null : index;
                      });
                    },
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                          color: selectedRating == index ? Colors.white : Colors.black,
                          border: Border.all(color: Colors.white),
                          shape: BoxShape.circle),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            size: 12,
                            color: selectedRating == index ? Colors.black : Colors.white,
                          ),
                          const Gap(2),
                          Text(
                            "${index + 1}",
                            style: theme.titleSmall?.copyWith(
                              color: selectedRating == index ? Colors.black : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const Gap(20),
            Text(
              "Category",
              style: theme.titleSmall,
            ),

            const Gap(10),
            //category

            Container(
              height: 38,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff23262F)), borderRadius: BorderRadius.circular(100)),
              child: Row(
                children: [
                  const Expanded(flex: 2, child: Icon(HugeIcons.strokeRoundedClothes)),
                  Expanded(flex: 6, child: Text("Crop Top", style: theme.titleSmall)),
                  const Expanded(flex: 2, child: Icon(Icons.arrow_drop_down)),
                ],
              ),
            ),

            const Gap(10),
            Text(
              "Discount",
              style: theme.titleSmall,
            ),
            const Gap(10),
            Expanded(
              child: SizedBox(
                height: 38,
                width: double.infinity,
                child: GridView(
                  //    itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4, childAspectRatio: 3),
                  // itemBuilder: (context, index) {
                  //   return Container(
                  //     height: 30,
                  //     width: 100,
                  //     decoration: BoxDecoration(
                  //         border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(20)),
                  //     child: Row(
                  //       children: [
                  //         Text(""),
                  //       ],
                  //     ),
                  //   );
                  // },
                  children: [
                    Container(
                      alignment: AlignmentDirectional.center,
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("50% off", style: theme.titleSmall),
                            const Icon(HugeIcons.strokeRoundedCancel01)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.center,
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("40% off", style: theme.titleSmall),
                            const Icon(HugeIcons.strokeRoundedCancel01)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.center,
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("30% off", style: theme.titleSmall),
                            const Icon(HugeIcons.strokeRoundedCancel01)
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.center,
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("25% off", style: theme.titleSmall),
                            const Icon(HugeIcons.strokeRoundedCancel01)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedBtn(
                  onTap: () {
                    context.screenPop();
                  },
                  height: 40,
                  width: 112,
                  backgroundColor: Colors.white,
                  radius: 100,
                  isBorderBtn: false,
                  text: "Apply",
                  textColor: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
