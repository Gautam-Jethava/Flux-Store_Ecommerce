import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_screen_state.dart';

class BottomNavigationScreenCubit extends Cubit<BottomNavigationScreenState> {
  BottomNavigationScreenCubit() : super(const BottomNavigationScreenState(0));

  void changeIndex(int index) {
    emit(BottomNavigationScreenState(index));
  }
}
