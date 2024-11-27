import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/packages/helper/helper_function.dart';
import 'package:flux_store/src/ui/search_view_screen.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../components/discover_collection_widget.dart';
import '../components/filter_drawer_widget.dart';
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
    final dark = HelperFunction.isDarkMode(context);
    return BlocBuilder<DiscoverScreenCubit, DiscoverScreenState>(
      builder: (context, state) {
        return Scaffold(
          endDrawer: const FilterDrawerWidget(),
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
                          onTap: () {
                            context.screenNavigateToNamed(SearchScreenView.routeName);
                          },
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            height: 46,
                            width: 260,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: dark ? const Color(0xff23262F) : const Color(0xffFAFAFA)),
                            child: const Row(
                              children: [
                                Gap(20),
                                Icon(Icons.search),
                                Gap(20),
                                Text("Search"),
                              ],
                            ),
                          ),
                        ),

                        //filter icon
                        Container(
                          alignment: AlignmentDirectional.center,
                          height: 46,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: dark ? const Color(0xff23262F) : const Color(0xffFAFAFA)),
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

                  //images
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
