import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/packages/helper/helper_function.dart';
import 'package:flux_store/src/ui/search_product_found_screen_view.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../components/back_to_previous_screen_btn_widget.dart';
import '../logic/search_screen_cubit/search_screen_cubit.dart';
import '../packages/domain/repositories/product_list_repository.dart';
import '../utils/logger.dart';
import '../utils/widgets/popular_week_product_widget.dart';

class SearchScreenView extends StatefulWidget {
  const SearchScreenView({super.key});

  static String routeName = "/SearchScreenView";

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchScreenCubit(ProductListRepository())..fetchProductList(),
      child: const SearchScreenView(),
    );
  }

  @override
  State<SearchScreenView> createState() => _SearchScreenViewState();
}

class _SearchScreenViewState extends State<SearchScreenView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return BlocBuilder<SearchScreenCubit, SearchScreenState>(
      builder: (context, state) {
        final cubit = context.read<SearchScreenCubit>();
        Log.debug("Product length :- ${state.productList.length}");
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackToPreviousScreenBtn(),
                  const Gap(30),

                  //search bar
                  SearchBarWidget(
                    cubit: cubit,
                  ),
                  const Gap(40),

                  //search history
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Recent Searches"),
                      IconButton(
                        icon: const Icon(HugeIcons.strokeRoundedDelete02),
                        onPressed: () {
                          setState(() {
                            cubit.searchHistoryItem.clear();
                          });
                        },
                      )
                    ],
                  ),
                  const Gap(20),

                  searchHistory(context),

                  const Gap(40),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular this week",
                        style: theme.titleLarge,
                      ),
                      Text(
                        "Show all",
                        style: theme.titleSmall?.copyWith(color: const Color(0xffE6E8EC)),
                      ),
                    ],
                  ),
                  const Gap(20),
                  PopularWeekProductWidget(productList: cubit.productList),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  SizedBox searchHistory(BuildContext context) {
    final cubit = context.read<SearchScreenCubit>();
    final dark = HelperFunction.isDarkMode(context);
    final theme = Theme.of(context).textTheme;
    return SizedBox(
      height: 140,
      width: 340,
      child: Wrap(
        spacing: 20,
        runSpacing: 10,
        children: List.generate(
          cubit.searchHistoryItem.length,
          (index) => Chip(
            color: WidgetStatePropertyAll(
              dark ? const Color(0xff23262F) : const Color(0xffFAFAFA),
            ),
            label: Text(
              cubit.searchHistoryItem[index],
              style: theme.labelMedium?.copyWith(
                color: dark ? const Color(0xffB1B5C3) : const Color(0xff33302E).withOpacity(0.6),
              ),
            ),
            onDeleted: () {
              setState(() {
                cubit.searchHistoryItem.removeAt(index);
              });
            },
            deleteIcon: const Icon(
              HugeIcons.strokeRoundedCancel01,
              color: Color(0xff777E90),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({
    super.key,
    required this.cubit,
  });

  final SearchScreenCubit cubit;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final dark = HelperFunction.isDarkMode(context);
    final theme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //search bar
        Container(
          alignment: AlignmentDirectional.center,
          height: 46,
          width: 260,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: dark ? const Color(0xff23262F) : const Color(0xffFAFAFA)),
          child: TextFormField(
            controller: controller,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            onChanged: (value) {
              bool isNavigate = widget.cubit.searchItem(controller.text.trim());
              Log.debug(isNavigate);
              if (isNavigate) {
                context.screenNavigateToNamed(SearchProductFoundScreenView.routeName,
                    arguments: controller.text.trim());
              }
            },
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search",
              hintStyle: theme.titleMedium
                  ?.copyWith(color: dark ? const Color(0xffB1B5C3) : const Color(0xff33302E).withOpacity(0.6)),
              focusColor: Colors.transparent,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
            ),
          ),
        ),

        //filter icon
        Container(
          alignment: AlignmentDirectional.center,
          height: 46,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: dark ? const Color(0xff23262F) : const Color(0xffFAFAFA)),
          child: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  onPressed: () {
                    //Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(HugeIcons.strokeRoundedMenuSquare));
            },
          ),
        ),
      ],
    );
  }
}

/*

//API
SizedBox(
  height: 227,
  width: double.infinity,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: state.productList.isEmpty ? 0 : state.productList.length,
    itemBuilder: (context, index) {
      final list = state.productList[index];
      return SizedBox(
        height: 240,
        width: 126,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(list.images[0]),
                        fit: BoxFit.cover,
                        alignment: AlignmentDirectional.center),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(6),
                  Text(
                    list.title,
                    style: theme.titleSmall,
                  ),
                  Text(
                    "\$ ${list.price.toString()}",
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
    separatorBuilder: (context, index) {
      return const SizedBox(width: 24);
    },
  ),
),
 */
