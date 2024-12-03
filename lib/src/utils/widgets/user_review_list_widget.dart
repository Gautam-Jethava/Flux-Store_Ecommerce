import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:gap/gap.dart';

import '../../packages/helper/helper_function.dart';

class UserReviewListWidget extends StatelessWidget {
  const UserReviewListWidget({
    super.key,
    required this.userImage,
    required this.userName,
    required this.userReview,
    required this.time,
  });

  final String userImage;

  final String userName;

  final String userReview;
  final String time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final dark = HelperFunction.isDarkMode(context);
    return SizedBox(
      height: 80,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    height: 36,
                    width: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(userImage),
                      ),
                    ),
                  ),
                ),
                Gap(10),
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: theme.titleSmall?.copyWith(color: dark ? Colors.white : Colors.black),
                      ),
                      RatingStars(
                        value: 5,
                        maxValueVisibility: false,
                        valueLabelVisibility: false,
                        starSize: 9,
                        starColor: Color(0xff508A7B),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    time,
                    style: theme.titleSmall?.copyWith(color: dark ? Color(0xff33302E).withOpacity(0.3) : Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Gap(10),
          Expanded(
            child: Text(
              userReview,
              style: theme.titleSmall?.copyWith(fontWeight: FontWeight.normal, color: dark ? Colors.white : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
