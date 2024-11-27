import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PopularWeekProductWidget extends StatelessWidget {
  const PopularWeekProductWidget({
    super.key,
    required this.productList,
  });

  final List<Map<String, dynamic>> productList;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SizedBox(
      height: 227,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final list = productList[index];
          return SizedBox(
            height: 228,
            width: 126,
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(list['image']), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(12),
                      Text(
                        list['title'],
                        style: theme.titleSmall,
                      ),
                      const Gap(10),
                      Text(list['price']),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 24);
        },
      ),
    );
  }
}
