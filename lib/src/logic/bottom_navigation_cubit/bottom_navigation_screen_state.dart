part of 'bottom_navigation_screen_cubit.dart';

class BottomNavigationScreenState extends Equatable {
  final int currentIndex;
  const BottomNavigationScreenState(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];

  BottomNavigationScreenState copyWith({int? currentIndex}) {
    return BottomNavigationScreenState(currentIndex ?? this.currentIndex);
  }
}
