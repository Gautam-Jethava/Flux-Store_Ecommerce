import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/utils/constants/image_path.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../components/home_screen_category_icon.dart';
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
    List<IconData> icons = [Icons.woman, Icons.man, HugeIcons.strokeRoundedGlasses, HugeIcons.strokeRoundedAiBeautify];
    List<String> bannerImages = [ImagePath.bannerAdImage, ImagePath.bannerAdImage1, ImagePath.bannerAdImage2];

    List<Map<String, dynamic>> productList = [
      {'image': ImagePath.modelImage1, 'title': "Turtleneck Sweater", "price": "\$39.99"},
      {'image': ImagePath.modelImage2, 'title': "Long Sleeve Dress", "price": "\$45.00"},
      {'image': ImagePath.modelImage7, 'title': "Turtleneck Sweater", "price": "\$39.99"},
      {'image': ImagePath.modelImage8, 'title': "Long Sleeve Dress", "price": "\$45.00"},
      {'image': ImagePath.modelImage9, 'title': "Long Sleeve Dress", "price": "\$45.00"},
      {'image': ImagePath.modelImage3, 'title': "Sportswear Set", "price": "\$80.99"},
      {'image': ImagePath.modelImage4, 'title': "Elegant Dress", "price": "\$75.00"},
    ];
    List<Map<String, dynamic>> recommendedProductList = [
      {'image': ImagePath.modelImage5, 'title': 'White fashion hoodie', 'price': '\$29.00'},
      {'image': ImagePath.modelImage6, 'title': 'White fashion hoodie', 'price': '\$30.00'},
      {'image': ImagePath.modelImage5, 'title': 'White fashion hoodie', 'price': '\$29.00'},
      {'image': ImagePath.modelImage6, 'title': 'White fashion hoodie', 'price': '\$30.00'},
      {'image': ImagePath.modelImage5, 'title': 'White fashion hoodie', 'price': '\$29.00'},
      {'image': ImagePath.modelImage6, 'title': 'White fashion hoodie', 'price': '\$30.00'},
    ];

    int isSelected = 0;
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Gap(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        4,
                        (index) => HomeScreenCategoryIcon(
                          icon: icons[index],
                          isSelected: state.categoryIndex == index,
                          onTap: () => context.read<HomeScreenCubit>().changeCategory(index),
                        ),
                      ),
                    ),

                    // ad banner
                    const Gap(50),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 170,
                            width: 312,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                alignment: Alignment.center,
                                image: AssetImage(bannerImages[state.bannerIndex]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 124,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                3,
                                (index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: isSelected == index ? Colors.white : Colors.red,
                                      shape: BoxShape.circle,
                                      border: isSelected == index
                                          ? Border.all(color: Colors.black, width: 1)
                                          : const Border.fromBorderSide(BorderSide.none),
                                      boxShadow: isSelected == index
                                          ? [
                                              BoxShadow(
                                                color: isSelected == index ? Colors.white : Colors.black,
                                                spreadRadius: 1,
                                                blurStyle: BlurStyle.inner,
                                                offset: const Offset(0, 0),
                                              ),
                                            ]
                                          : [],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                              right: 20,
                              top: 20,
                              child: Text(
                                "Autumn\nCollection\n2021",
                                style: theme.headlineMedium?.copyWith(fontSize: 22, letterSpacing: 0.2),
                              )),
                        ],
                      ),
                    ),

                    const Gap(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Feature Products",
                            style: theme.titleLarge,
                          ),
                          Text(
                            "Show all",
                            style: theme.labelMedium?.copyWith(
                              fontWeight: FontWeight.w200,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(30),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 227,
                        width: double.infinity,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            final list = productList[index];
                            return SizedBox(
                              height: 228,
                              width: 126,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(image: AssetImage(list['image']), fit: BoxFit.cover),
                                          borderRadius: BorderRadius.circular(10)),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Gap(12),
                                        Text(
                                          list['title'],
                                          style: theme.titleSmall,
                                        ),
                                        const Gap(10),
                                        Text(list['price']),
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
                    ),
                    const Gap(20),
                    Image.asset(ImagePath.bannerAdImage3),
                    const Gap(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Recommended",
                                style: theme.titleLarge,
                              ),
                              Text(
                                "Show all",
                                style: theme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                          SizedBox(
                            height: 66,
                            width: double.infinity,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final list = recommendedProductList[index];
                                return Container(
                                  height: 66,
                                  width: 214,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xff23262F)),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color(0xff23262F),
                                          blurRadius: 4,
                                          spreadRadius: 0.6,
                                          blurStyle: BlurStyle.outer),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 66,
                                        width: 66,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(list['image']),
                                          ),
                                        ),
                                        //color: Colors.green,
                                      ),
                                      SizedBox(
                                        height: 66,
                                        width: 146,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 6),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                list['title'],
                                                style: theme.titleSmall,
                                              ),
                                              Text(
                                                list['price'],
                                                style: theme.titleSmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                        //color: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(width: 18);
                              },
                              itemCount: recommendedProductList.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Top Collection",
                                style: theme.titleLarge,
                              ),
                              Text(
                                "Show all",
                                style: theme.labelMedium?.copyWith(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const Gap(40),
                          Image.asset(ImagePath.bannerAdImage1),
                          const Gap(20),
                          Image.asset(ImagePath.bannerAdImage4),
                        ],
                      ),
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
