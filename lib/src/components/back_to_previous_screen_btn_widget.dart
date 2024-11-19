import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flux_store/src/utils/constants/navigation_extension.dart';

import '../packages/helper/helper_function.dart';

class BackToPreviousScreenBtn extends StatelessWidget {
  const BackToPreviousScreenBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDarkMode(context);
    return Container(
      alignment: Alignment.center,
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        color: dark ? Colors.black : Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: dark ? Colors.white : Colors.black,
            blurRadius: 6,
            spreadRadius: 2,
            blurStyle: BlurStyle.inner,
            offset: const Offset(0, 0.9),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () => context.screenPop(),
        icon: const Icon(
          CupertinoIcons.back,
          size: 20,
        ),
      ),
    );
  }
}
