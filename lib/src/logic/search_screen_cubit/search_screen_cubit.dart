import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/packages/domain/model/product_model/product_model.dart';
import 'package:flux_store/src/utils/logger.dart';

import '../../packages/domain/repositories/product_list_repository.dart';
import '../../utils/constants/image_path.dart';

part 'search_screen_state.dart';

class SearchScreenCubit extends Cubit<SearchScreenState> {
  final ProductListRepository productListRepo;
  SearchScreenCubit(this.productListRepo) : super(const SearchScreenState([]));

  List<String> searchItemName = [
    'Dress',
    'Sunglasses',
    'Sweater',
    'Hoodie',
  ];
  List<String> searchHistoryItem = [
    'Sunglasses',
    'Sweater',
    'Hoodie',
  ];

  List<Map<String, dynamic>> productList = [
    {'image': ImagePath.modelImage7, 'title': "Turtleneck Sweater", "price": "\$39.99"},
    {'image': ImagePath.modelImage8, 'title': "Long Sleeve Dress", "price": "\$45.00"},
    {'image': ImagePath.modelImage9, 'title': "Long Sleeve Dress", "price": "\$45.00"},
    {'image': ImagePath.modelImage1, 'title': "Turtleneck Sweater", "price": "\$39.99"},
    {'image': ImagePath.modelImage2, 'title': "Long Sleeve Dress", "price": "\$45.00"},
    {'image': ImagePath.modelImage3, 'title': "Sportswear Set", "price": "\$80.99"},
    {'image': ImagePath.modelImage4, 'title': "Elegant Dress", "price": "\$75.00"},
  ];
  Future<void> fetchProductList() async {
    try {
      final products = await productListRepo.getProductList();
      Log.debug("Product :- $products");
      emit(state.copyWith(productList: products));
    } catch (e) {
      Log.error("Error from Search Cubit:- ${e.toString()}");
    }
  }

  bool searchItem(String itemName) {
    final lowerCaseItemName = itemName.toLowerCase();

    if (searchItemName.any((element) => element.toLowerCase() == lowerCaseItemName)) {
      Log.success("Search Found it");

      return true;
    } else {
      Log.error("Search name empty Found it");
      return false;
    }
  }
}
