import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/logic/bottom_navigation_cubit/bottom_navigation_screen_cubit.dart';
import 'package:flux_store/src/logic/home_screen_cubit/home_screen_cubit.dart';
import 'package:flux_store/src/ui/home_screen_view.dart';
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
    return BlocBuilder<BottomNavigationScreenCubit, BottomNavigationScreenState>(
      builder: (context, state) {
        final theme = Theme.of(context).textTheme;
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(
              HugeIcons.strokeRoundedMenu05,
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
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color(0xff353946),
            elevation: 0,
            onTap: (index) {
              context.read<BottomNavigationScreenCubit>().changeIndex(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedHome01), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedSearch01), label: 'search'),
              BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedShoppingBag01), label: 'shop'),
              BottomNavigationBarItem(icon: Icon(HugeIcons.strokeRoundedUser), label: 'Setting'),
            ],
          ),
        );
      },
    );
  }
}
