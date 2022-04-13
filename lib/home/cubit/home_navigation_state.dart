part of 'home_navigation_cubit.dart';

class HomeNavigationState extends Equatable {
  final int index;
  HomeNavigationState(this.navbarItem, this.index);
  @override
  List<Object> get props => [this.navbarItem, this.index];
  final HomePages navbarItem;
}
