import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flux_store/src/utils/widgets/star_rating_widget.dart';
import 'package:flux_store/src/utils/widgets/user_review_list_widget.dart';
import 'package:gap/gap.dart';

import '../../packages/helper/helper_function.dart';
import '../constants/image_path.dart';

class ProductInfoDetailsWidget extends StatefulWidget {
  const ProductInfoDetailsWidget({
    super.key,
  });

  @override
  State<ProductInfoDetailsWidget> createState() => _ProductInfoDetailsWidgetState();
}

class _ProductInfoDetailsWidgetState extends State<ProductInfoDetailsWidget> {
  bool isExpansionDescriptionIcon = false;
  bool isExpansionReviewIcon = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final dark = HelperFunction.isDarkMode(context);
    List<Map<String, dynamic>> productList = [
      {'image': ImagePath.modelImage1, 'title': "Turtleneck Sweater", "price": "\$39.99"},
      {'image': ImagePath.modelImage2, 'title': "Long Sleeve Dress", "price": "\$45.00"},
      {'image': ImagePath.modelImage7, 'title': "Turtleneck Sweater", "price": "\$39.99"},
      {'image': ImagePath.modelImage8, 'title': "Long Sleeve Dress", "price": "\$45.00"},
      {'image': ImagePath.modelImage9, 'title': "Long Sleeve Dress", "price": "\$45.00"},
      {'image': ImagePath.modelImage3, 'title': "Sportswear Set", "price": "\$80.99"},
      {'image': ImagePath.modelImage4, 'title': "Elegant Dress", "price": "\$75.00"},
    ];
    return Container(
      height: 380,
      width: double.infinity,
      decoration: BoxDecoration(
        color: dark ? Colors.black : Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1, spreadRadius: 0.3, offset: Offset(0, 1.6), blurStyle: BlurStyle.outer)],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sportswear Set", style: theme.titleMedium),
                  Text("\$80.00", style: theme.titleMedium),
                ],
              ),
              const Gap(10),
              SizedBox(
                height: 14,
                width: 140,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const RatingStars(
                      value: 5,
                      valueLabelVisibility: false,
                      starColor: Color(0xff508A7B),
                    ),
                    Text(
                      "(83)",
                      style: theme.labelSmall,
                    )
                  ],
                ),
              ),
              const Gap(20),
              Divider(color: dark ? const Color(0xff23262F) : const Color(0xffF3F3F6)),
              const Gap(10),
              SizedBox(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Color",
                            style: theme.titleSmall?.copyWith(color: dark ? const Color(0xffB1B5C3) : const Color(0xff777E90)),
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 34,
                                width: 34,
                                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xffE7C0A7),
                                      boxShadow: dark
                                          ? []
                                          : [
                                              const BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 0.4,
                                                blurRadius: 0.5,
                                              )
                                            ]),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 34,
                                width: 34,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                    border: Border.all(color: dark ? const Color(0xff313131) : Colors.transparent, width: 2),
                                  ),
                                ),
                              ),
                              const Gap(10),
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 34,
                                width: 34,
                                decoration: const BoxDecoration(shape: BoxShape.circle),
                                child: Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xffEE6969),
                                    border: Border.all(color: dark ? const Color(0xff313131) : Colors.transparent, width: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Size",
                            style: theme.titleSmall?.copyWith(color: dark ? const Color(0xffB1B5C3) : const Color(0xff777E90)),
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(color: dark ? const Color(0xff23262F) : const Color(0xffFAFAFA), shape: BoxShape.circle),
                                child: const Text("S"),
                              ),
                              const Gap(10),
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: dark ? const Color(0xff23262F) : const Color(0xffFAFAFA),
                                ),
                                child: const Text("M"),
                              ),
                              const Gap(10),
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(color: dark ? const Color(0xff23262F) : const Color(0xffFAFAFA), shape: BoxShape.circle),
                                child: const Text("L"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: dark ? const Color(0xff23262F) : const Color(0xffF3F3F6)),
              const Gap(10),

              // descriptions
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpansionDescriptionIcon = !isExpansionDescriptionIcon;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Description"),
                    isExpansionDescriptionIcon ? Icon(CupertinoIcons.chevron_down) : const Icon(CupertinoIcons.right_chevron),
                  ],
                ),
              ),
              Divider(color: dark ? const Color(0xff23262F) : const Color(0xffF3F3F6)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: isExpansionDescriptionIcon
                    ? [
                        Text(
                          "Sportswear is no longer under culture, it is no\nlonger indie or cobbled together as it once was.\nSport is fashion today. The top is oversized in fit\nand style, may need to size down.",
                          style: theme.labelSmall?.copyWith(letterSpacing: 1.4),
                        ),
                      ]
                    : [],
              ),
              const Gap(10),

              //reviews
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpansionReviewIcon = !isExpansionReviewIcon;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Reviews"),
                    isExpansionReviewIcon ? Icon(CupertinoIcons.chevron_down) : const Icon(CupertinoIcons.right_chevron),
                  ],
                ),
              ),
              Divider(color: dark ? const Color(0xff23262F) : const Color(0xffF3F3F6)),
              Column(
                children: isExpansionReviewIcon
                    ? [
                        SizedBox(
                          height: 45,
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: Text("4.9", style: theme.headlineLarge)),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "out of 5",
                                  style: theme.labelSmall?.copyWith(color: Color(0xff8A8A8F)),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    RatingStars(
                                      value: 5,
                                      maxValueVisibility: false,
                                      valueLabelVisibility: false,
                                      starColor: Color(0xff508A7B),
                                    ),
                                    Gap(4),
                                    Text(
                                      "83 rating",
                                      style: theme.labelSmall?.copyWith(color: Color(0xff8A8A8F)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(10),

                        // star rating widget
                        StarRatingWidget(),
                        Gap(20),

                        //write review
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: Text(
                                "47 Reviews",
                                style: theme.titleSmall?.copyWith(color: dark ? Color(0xffFFFFFF) : Color(0xff8A8A8F)),
                              ),
                            ),
                            Text(
                              "WRITE A REVIEW ",
                              style: theme.titleSmall?.copyWith(color: dark ? Color(0xffFFFFFF) : Color(0xff8A8A8F), fontWeight: FontWeight.normal),
                            ),
                            Icon(Icons.edit, size: 16, color: dark ? Color(0xffFFFFFF) : Color(0xff8A8A8F)),
                            Gap(40),
                          ],
                        ),
                        Gap(40),

                        //review list

                        UserReviewListWidget(
                          userName: "Jennifer Rose",
                          userImage: ImagePath.modelImage1,
                          userReview: "I love it.  Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!",
                          time: "5m ago",
                        ),
                        Gap(20),
                        UserReviewListWidget(
                          userName: "Jennifer Rose",
                          userImage: ImagePath.modelImage1,
                          userReview: "I love it.  Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!",
                          time: "5m ago",
                        ),

                        Gap(20),
                        SizedBox(
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
                      ]
                    : [],
              ),
              const Gap(10),
            ],
          ),
        ),
      ),
    );
  }
}
