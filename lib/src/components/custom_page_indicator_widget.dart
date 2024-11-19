import 'package:flutter/material.dart';

class CustomPageIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const CustomPageIndicatorWidget({
    super.key,
    required this.currentPage,
    required this.pageCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? Colors.white : Colors.transparent,
            border: Border.all(color: Colors.white, width: 2),
          ),
        );
      }),
    );
  }
}
