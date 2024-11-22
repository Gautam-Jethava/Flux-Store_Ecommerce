import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.red,
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: Colors.black, width: 1) : const Border.fromBorderSide(BorderSide.none),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: isSelected ? Colors.white : Colors.black,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.inner,
                  offset: const Offset(0, 0),
                ),
              ]
            : [],
      ),
    );
  }
}
