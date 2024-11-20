part of 'home_screen_cubit.dart';

class HomeScreenState extends Equatable {
  final int categoryIndex;
  const HomeScreenState(this.categoryIndex);
  @override
  List<Object> get props => [categoryIndex];
  HomeScreenState copyWith({int? categoryIndex}) {
    return HomeScreenState(categoryIndex ?? this.categoryIndex);
  }
}
