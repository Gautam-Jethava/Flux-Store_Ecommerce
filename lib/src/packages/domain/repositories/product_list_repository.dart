import 'package:dio/dio.dart';
import 'package:flux_store/src/interceptor/dio_interceptors.dart';

import '../../../utils/logger.dart';
import '../model/product_model/product_model.dart';

class ProductListRepository {
  final DioInterceptors _dio = DioInterceptors();

  Future<List<ProductModel>> getProductList() async {
    try {
      final response = await _dio.getProductListApi();
      final data = response.data as List;
      Log.debug("Repo :- $data");
      return data.map((e) => ProductModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception("Failed to call API: $e");
    }
  }
}
/*
class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(ProductInitial());

  List<ProductShowModel> allProducts = [];

  void searchProducts(
      String query, TabController tabController, List<String?> categoryList) {
    if (query.isEmpty) {
      emit(ProductLoaded(allProducts));
    } else {
      final filteredProducts = allProducts.where((product) {
        final titleMatches =
            product.title?.toLowerCase().contains(query) ?? false;
        final brandMatches =
            product.brand?.toLowerCase().contains(query) ?? false;
        final categoryMatches =
            product.category?.toLowerCase().contains(query) ?? false;
        return titleMatches || brandMatches || categoryMatches;
      }).toList();

      if (filteredProducts.isNotEmpty) {
        final firstProduct = filteredProducts.first;
        final categoryIndex = categoryList.indexWhere((category) =>
            category?.toLowerCase() == firstProduct.category?.toLowerCase());
        if (categoryIndex != -1) {
          tabController.animateTo(categoryIndex);
        }
      } else {
        final categoryIndex = categoryList.indexWhere(
            (category) => category?.toLowerCase() == query.toLowerCase());
        if (categoryIndex != -1) {
          tabController.animateTo(categoryIndex);
        }
      }
      emit(ProductLoaded(filteredProducts));
    }
  }
}
 */
