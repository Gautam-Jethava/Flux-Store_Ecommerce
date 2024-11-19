import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState(currentIndex: 0));

  void updateIndex(int index) {
    emit(OnboardingState(currentIndex: index));
  }
}
