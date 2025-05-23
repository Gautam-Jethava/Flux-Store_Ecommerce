import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/src/packages/domain/repositories/product_list_repository.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(const HomeScreenState(0, 0)) {
    changeBanner();
  }

  Timer? timer;
  ProductListRepository productListRepository = ProductListRepository();

  void changeCategory(int index) {
    emit(state.copyWith(categoryIndex: index));
  }

  void changeBanner() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      final currentBannerIndex = state.bannerIndex;
      final nextBannerIndex = currentBannerIndex < 2 ? currentBannerIndex + 1 : 0;

      emit(state.copyWith(bannerIndex: nextBannerIndex));
    });
  }
}
