import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:setask/home/home_items.dart';

part 'home_navigation_state.dart';

class HomeNavigationCubit extends Cubit<HomeNavigationState> {
  HomeNavigationCubit() : super(HomeNavigationState(HomePages.home, 0));

  void getNavBarItem(HomePages page) {
    switch (page) {
      case HomePages.home:
        emit(HomeNavigationState(HomePages.home, 0));
        break;
      case HomePages.incoming:
        emit(HomeNavigationState(HomePages.incoming, 1));
        break;
      case HomePages.outgoing:
        emit(HomeNavigationState(HomePages.outgoing, 2));
        break;
      case HomePages.profile:
        emit(HomeNavigationState(HomePages.profile, 3));
        break;
    }
  }
}
