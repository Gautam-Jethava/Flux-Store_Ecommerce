import 'package:flutter/material.dart';

class FavouriteProductIconWidget extends StatefulWidget {
  const FavouriteProductIconWidget({
    super.key,
  });

  @override
  State<FavouriteProductIconWidget> createState() => _FavouriteProductIconWidgetState();
}

class _FavouriteProductIconWidgetState extends State<FavouriteProductIconWidget> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 32,
      width: 32,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 6,
            spreadRadius: 0.2,
            blurStyle: BlurStyle.inner,
            offset: Offset(0, 0.9),
          ),
        ],
      ),
      child: IconButton(
          onPressed: () {
            setState(() {
              isFav = !isFav;
            });
          },
          icon: Icon(
            Icons.favorite,
            size: 17,
            color: isFav ? const Color(0xffFF6E6E) : const Color(0xffD8D8D8),
          )),
    );
  }
}
