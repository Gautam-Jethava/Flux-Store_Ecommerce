import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/constants/image_path.dart';

class DiscoverCollectionWidget extends StatefulWidget {
  const DiscoverCollectionWidget({
    super.key,
  });

  @override
  State<DiscoverCollectionWidget> createState() => _DiscoverCollectionWidgetState();
}

class _DiscoverCollectionWidgetState extends State<DiscoverCollectionWidget> {
  int? imageExpanded;

  @override
  Widget build(BuildContext context) {
    final List<String> discoverImages = [
      ImagePath.discoverImage1,
      ImagePath.discoverImage2,
      ImagePath.discoverImage3,
      ImagePath.discoverImage4,
    ];

    List<Map<String, dynamic>> discoverImageItems = [
      {
        'title': 'Jacket',
        'totalCount': '128 Items',
        'icon': const Icon(CupertinoIcons.right_chevron),
      },
      {
        'title': 'Skirts',
        'totalCount': '40 Items',
        'icon': const Icon(CupertinoIcons.right_chevron),
      },
      {
        'title': 'Dress',
        'totalCount': '56 Items',
        'icon': const Icon(CupertinoIcons.right_chevron),
      },
      {
        'title': 'Sweets',
        'totalCount': '36 Items',
        'icon': const Icon(CupertinoIcons.right_chevron),
      },
      {
        'title': 'Jeans',
        'totalCount': '14 Items',
        'icon': const Icon(CupertinoIcons.right_chevron),
      },
      {
        'title': 'T-Shirts',
        'totalCount': '12 Items',
        'icon': const Icon(CupertinoIcons.right_chevron),
      },
      {
        'title': 'Pants',
        'totalCount': '18 Items',
        'icon': const Icon(CupertinoIcons.right_chevron),
      },
    ];

    return ListView.separated(
      itemCount: discoverImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              imageExpanded = imageExpanded == index ? null : index;
            });
          },
          child: Column(
            children: [
              Image.asset(
                discoverImages[index],
                fit: BoxFit.cover,
              ),
              if (imageExpanded == index)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SizedBox(
                    height: 396,
                    width: 340,
                    child: SingleChildScrollView(
                      child: Column(
                        children: discoverImageItems.asMap().entries.map(
                          (entry) {
                            //final index = entry.key;
                            final item = entry.value;
                            return Container(
                              alignment: AlignmentDirectional.center,
                              height: 55,
                              width: 340,
                              decoration: const BoxDecoration(
                                border: Border(bottom: BorderSide(color: Color(0xff23262F))),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(flex: 5, child: Text(item['title'])),
                                  Expanded(flex: 2, child: Text(item['totalCount'])),
                                  Expanded(
                                    child: item['icon'],
                                  ),
                                ], // Access title using index
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Gap(30);
      },
    );
  }
}
