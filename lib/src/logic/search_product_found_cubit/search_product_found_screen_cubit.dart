import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/constants/image_path.dart';

part 'search_product_found_screen_state.dart';

class SearchProductFoundScreenCubit extends Cubit<SearchProductFoundScreenState> {
  SearchProductFoundScreenCubit() : super(const SearchProductFoundScreenState());

  List<Map<String, dynamic>> resultsProductList = [
    {
      'image': ImagePath.modelImage10,
      'title': "Linen Dress",
      "price": "\$49.99",
      'rating': 5.0,
      'totalReview': 60,
      'realAmount': "\$68",
    },
    {
      'image': ImagePath.modelImage11,
      'title': "Filed Waist Dress",
      "price": "\$87.99",
      'rating': 4.2,
      'totalReview': 54,
      'realAmount': "\$68",
    },
    {
      'image': ImagePath.modelImage12,
      'title': "Maxi Dress",
      "price": "\$69.99",
      'rating': 5.0,
      'totalReview': 26,
      'realAmount': "\$81",
    },
    {
      'image': ImagePath.modelImage13,
      'title': "Front Tie Mini Dress",
      "price": "\$64.99",
      'rating': 3.0,
      'totalReview': 47,
      'realAmount': "\$68",
    },
    {
      'image': ImagePath.modelImage14,
      'title': "Ohara Dress",
      "price": "\$52.99",
      'rating': 5.0,
      'totalReview': 65,
      'realAmount': "\$68",
    },
    {
      'image': ImagePath.modelImage15,
      'title': "Tie Back Mini Dress",
      "price": "\$61.99",
      'rating': 4.2,
      'totalReview': 23,
      'realAmount': "\$68",
    },
    {
      'image': ImagePath.modelImage16,
      'title': "Leaves Green Dress",
      "price": "\$89.99",
      'rating': 4.5,
      'totalReview': 55,
      'realAmount': "\$68",
    },
    {
      'image': ImagePath.modelImage17,
      'title': "Off Shoulder Dress",
      "price": "\$78.99",
      'rating': 4.2,
      'totalReview': 84,
      'realAmount': "\$68",
    },
  ];
}
