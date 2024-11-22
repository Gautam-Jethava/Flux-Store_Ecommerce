import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  const ElevatedBtn(
      {super.key,
      required this.height,
      required this.width,
      required this.backgroundColor,
      this.onTap,
      required this.radius,
      required this.isBorderBtn,
      this.borderColor,
      required this.text,
      required this.textColor});

  final double height;
  final double width;
  final double radius;
  final Color backgroundColor;
  final Color? borderColor;
  final bool isBorderBtn;
  final Color textColor;
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    //final isDarkMode = HelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border:
              isBorderBtn ? Border.all(color: borderColor!, width: 1) : const Border.fromBorderSide(BorderSide.none),
        ),
        child: Text(text, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: textColor)),
      ),
    );
  }
}
