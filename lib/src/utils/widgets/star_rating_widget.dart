import 'package:flutter/material.dart';
import 'package:flux_store/src/utils/widgets/star_rating_bar_widget.dart';

class StarRatingWidget extends StatelessWidget {
  const StarRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) {
        final lineNo = (5 - index).toString();
        final starLinerValue = [0.8, 0.4, 0.3, 0.2, 0.0];
        final starLinerPercentage = [80.0, 40.0, 30.0, 20.0, 0.0];

        return StarRatingBarWidget(
          lineNo: lineNo,
          starLinerValue: starLinerValue[index],
          starLinerPercentage: starLinerPercentage[index],
        );
      }),
    );
  }
}
