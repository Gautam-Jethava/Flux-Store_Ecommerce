import 'package:flutter/material.dart';

import '../../packages/helper/helper_function.dart';

class StarRatingBarWidget extends StatelessWidget {
  const StarRatingBarWidget({
    super.key,
    required this.lineNo,
    required this.starLinerValue,
    required this.starLinerPercentage,
  });

  final String lineNo;
  final double starLinerValue;
  final double starLinerPercentage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final dark = HelperFunction.isDarkMode(context);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            lineNo,
            style: theme.labelSmall?.copyWith(color: Color(0xff8A8A8F)),
          ),
        ),
        Expanded(
          flex: 1,
          child: Icon(
            Icons.star,
            size: 14,
            color: Color(0xff508A7B),
          ),
        ),
        Expanded(
          flex: 10,
          child: LinearProgressIndicator(
            value: starLinerValue,
            borderRadius: BorderRadius.circular(10),
            valueColor: AlwaysStoppedAnimation(Color(0xff508A7B)),
            backgroundColor: dark ? Color(0xffFFFFFF) : Color(0xffEFF0F1),
          ),
        ),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${starLinerPercentage.toStringAsFixed(0)}.%",
              style: theme.labelSmall?.copyWith(color: Color(0xff8A8A8F)),
            ),
          ),
        ),
      ],
    );
  }
}
