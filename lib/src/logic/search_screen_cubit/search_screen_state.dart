part of 'search_screen_cubit.dart';

class SearchScreenState extends Equatable {
  final List<ProductModel> productList;

  const SearchScreenState(this.productList);

  @override
  List<Object> get props => [productList];

  SearchScreenState copyWith({List<ProductModel>? productList}) {
    return SearchScreenState(productList ?? this.productList);
  }
}
