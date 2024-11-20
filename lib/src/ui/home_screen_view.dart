import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../logic/home_screen_cubit/home_screen_cubit.dart';

class HomeScreenView extends StatelessWidget {
  static String routeName = "/HomeScreenView";

  const HomeScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: const HomeScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    List<Color> colors = [Colors.red, Colors.cyanAccent, Colors.blue, Colors.green];
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(
              HugeIcons.strokeRoundedMenu05,
            ),
            centerTitle: true,
            title: Text(
              "FluxStore",
              style: theme.titleMedium,
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: Icon(HugeIcons.strokeRoundedNotification03),
              )
            ],
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                      (index) {
                        return Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(color: colors[index]),
                        );
                      },
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
