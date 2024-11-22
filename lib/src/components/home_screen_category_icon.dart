import 'package:flutter/material.dart';

class HomeScreenCategoryIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const HomeScreenCategoryIcon({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          alignment: AlignmentDirectional.center,
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : const Color(0xff23262F),
            shape: BoxShape.circle,
            border:
                isSelected ? Border.all(color: Colors.black, width: 3) : const Border.fromBorderSide(BorderSide.none),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: isSelected ? Colors.white : Colors.black,
                      spreadRadius: 2,
                      blurStyle: BlurStyle.inner,
                      offset: const Offset(0, 0),
                    ),
                  ]
                : [],
          ),
          child: Icon(
            icon,
            color: isSelected ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
