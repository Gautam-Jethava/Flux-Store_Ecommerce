import 'package:flutter/material.dart';

class ProductImageDotWidget extends StatelessWidget {
  const ProductImageDotWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        3,
        (index) {
          int selected = 0;
          return Container(
            alignment: AlignmentDirectional.center,
            height: 12,
            width: 12,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: selected == index ? Colors.grey : Colors.transparent)),
            child: Container(
              height: 6,
              width: 6,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
