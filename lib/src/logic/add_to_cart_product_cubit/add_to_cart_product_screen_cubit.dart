import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_to_cart_product_screen_state.dart';

class AddToCartProductScreenCubit extends Cubit<AddToCartProductScreenState> {
  AddToCartProductScreenCubit() : super(AddToCartProductScreenState());

  bool notSelected = false;

  void selectProduct() {
    notSelected = !notSelected;
  }
}
