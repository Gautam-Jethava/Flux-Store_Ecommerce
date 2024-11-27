import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_screen_state.dart';

class ProductDetailsScreenCubit extends Cubit<ProductDetailsScreenState> {
  ProductDetailsScreenCubit() : super(const ProductDetailsScreenState());
}
