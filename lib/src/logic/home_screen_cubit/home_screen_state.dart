part of 'home_screen_cubit.dart';

class HomeScreenState extends Equatable {
  final int categoryIndex;
  final int bannerIndex;

  const HomeScreenState(this.categoryIndex, this.bannerIndex);

  @override
  List<Object> get props => [categoryIndex, bannerIndex];

  HomeScreenState copyWith({int? categoryIndex, int? bannerIndex}) {
    return HomeScreenState(categoryIndex ?? this.categoryIndex, bannerIndex ?? this.bannerIndex);
  }
}
