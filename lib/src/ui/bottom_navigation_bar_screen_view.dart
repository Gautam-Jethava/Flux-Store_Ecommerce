import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/logic/bottom_navigation_cubit/bottom_navigation_screen_cubit.dart';
import 'package:flux_store/src/logic/home_screen_cubit/home_screen_cubit.dart';
import 'package:flux_store/src/packages/helper/helper_function.dart';
import 'package:flux_store/src/ui/home_screen_view.dart';
import 'package:flux_store/src/utils/constants/image_path.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import '../logic/discover_screen_cubit/discover_screen_cubit.dart';
import 'discover_screen_view.dart';

class BottomNavigationBarScreenView extends StatelessWidget {
  static String routeName = "/BottomNavigationBarScreenView";

  const BottomNavigationBarScreenView({super.key});

  static Widget builder(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => BottomNavigationScreenCubit()),
      BlocProvider(create: (context) => HomeScreenCubit()),
      BlocProvider(create: (context) => DiscoverScreenCubit()),
    ], child: const BottomNavigationBarScreenView());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const HomeScreenView(),
      const DiscoverScreenView(),
      Container(
        height: 100,
        width: 100,
        color: Colors.blue,
      ),
      Container(
        height: 100,
        width: 100,
        color: Colors.green,
      ),
    ];
    List<String> screenNames = [
      'FluxStore',
      'Discover',
      'My Order',
      '',
    ];

    List<Map<String, dynamic>> bottomBarIcons = [
      {
        'icon': HugeIcons.strokeRoundedHome01,
        'label': 'Home',
      },
      {
        'icon': HugeIcons.strokeRoundedSearch01,
        'label': 'Search',
      },
      {
        'icon': HugeIcons.strokeRoundedShoppingBag01,
        'label': 'My Order',
      },
      {
        'icon': HugeIcons.strokeRoundedUser,
        'label': 'My Profile',
      },
    ];

    return BlocBuilder<BottomNavigationScreenCubit, BottomNavigationScreenState>(
      builder: (context, state) {
        final dark = HelperFunction.isDarkMode(context);
        final theme = Theme.of(context).textTheme;
        final cubit = context.read<BottomNavigationScreenCubit>();
        return Scaffold(
          drawer: MenuDrawer(bottomBarIcons: bottomBarIcons, cubit: cubit),
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(HugeIcons.strokeRoundedMenu05),
                );
              },
            ),
            centerTitle: true,
            title: Text(
              screenNames[state.currentIndex],
              style: theme.titleMedium,
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Icon(HugeIcons.strokeRoundedNotification03),
              )
            ],
          ),
          body: screens[state.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: dark ? Colors.white : Colors.black,
            unselectedItemColor: dark ? const Color(0xff353946) : const Color(0xffBEBFC4),
            elevation: 0,
            onTap: (index) {
              context.read<BottomNavigationScreenCubit>().changeIndex(index);
            },
            items: bottomBarIcons.map((e) {
              return BottomNavigationBarItem(icon: Icon(e['icon']), label: e['label']);
            }).toList(),
          ),
        );
      },
    );
  }
}

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key, required this.bottomBarIcons, required this.cubit});

  final List<Map<String, dynamic>> bottomBarIcons;
  final BottomNavigationScreenCubit cubit;

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final dark = HelperFunction.isDarkMode(context);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(ImagePath.profileImage),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sunie Pham",
                          style: theme.titleSmall,
                        ),
                        Text(
                          "sunieux@gmail.com",
                          style: theme.titleSmall,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: List.generate(
                widget.bottomBarIcons.length,
                (index) {
                  final bottomItem = widget.bottomBarIcons[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: GestureDetector(
                      onTap: () => widget.cubit.changeIndex(index),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        color: widget.cubit.state.currentIndex == index
                            ? dark
                                ? const Color(0xff23262F)
                                : const Color(0xffF4F5F6)
                            : Colors.transparent,
                        child: Row(
                          children: [
                            Icon(
                              bottomItem['icon'],
                              color: widget.cubit.state.currentIndex == index
                                  ? dark
                                      ? Colors.white
                                      : Colors.black
                                  : const Color(0xffB1B5C3),
                            ),
                            const Gap(40),
                            Text(
                              bottomItem['label'],
                              style: theme.titleMedium?.copyWith(
                                color: widget.cubit.state.currentIndex == index
                                    ? dark
                                        ? Colors.white
                                        : Colors.black
                                    : const Color(0xffB1B5C3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Gap(10),
            Text(
              "OTHER",
              style: theme.titleMedium?.copyWith(color: const Color(0xffB1B5C3)),
            ),
            const Gap(10),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    HugeIcons.strokeRoundedSettings01,
                    color: Color(0xffB1B5C3),
                  ),
                  const Gap(40),
                  Text(
                    'Setting',
                    style: theme.titleMedium?.copyWith(
                      color: const Color(0xffB1B5C3),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    HugeIcons.strokeRoundedMail01,
                    color: Color(0xffB1B5C3),
                  ),
                  const Gap(40),
                  Text(
                    'Support',
                    style: theme.titleMedium?.copyWith(
                      color: const Color(0xffB1B5C3),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(
                    HugeIcons.strokeRoundedInformationCircle,
                    color: Color(0xffB1B5C3),
                  ),
                  const Gap(40),
                  Text(
                    'About us',
                    style: theme.titleMedium?.copyWith(
                      color: const Color(0xffB1B5C3),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(40),
            Container(
              height: 38,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: dark ? const Color(0xff23262F) : const Color(0xffF4F4F4),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 28,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Gap(10),
                          Icon(Icons.sunny),
                          Gap(10),
                          Text("Light"),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 28,
                      width: 100,
                      decoration: BoxDecoration(
                          color: const Color(0xff353945),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: dark ? Colors.white : Colors.black,
                              blurRadius: 6,
                              spreadRadius: 0.2,
                              blurStyle: BlurStyle.inner,
                              offset: const Offset(-0.1, -1),
                            ),
                          ]),
                      child: const Row(
                        children: [
                          Gap(10),
                          Icon(Icons.dark_mode_outlined),
                          Gap(10),
                          Text("Dark"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
