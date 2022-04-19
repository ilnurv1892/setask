import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_repository/authentication_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  final UserRepository _userRepository;
  final UserModel userModel;

  UserBloc(this._userRepository, this.userModel) : super(UserState(userModel)) {
    on<FetchEvent>(fetchUserData);
    on<CreateEvent>(createUserData);
  }

  fetchUserData(FetchEvent event, Emitter<UserState> emit) async {
    try {
      UserModel userData = await _userRepository.retrieveUserData(userModel.id);

      emit(
        state.copyWith(status: Status.fetched, user: userData),
      );
      print("user fetched");
    } catch (ex) {
      emit(state.copyWith(status: Status.failure));
    }
  }

  createUserData(CreateEvent event, Emitter<UserState> emit) async {
    try {
      await _userRepository.storeNewUser(userModel);
      emit(state.copyWith(status: Status.saved));
      print("user created");
    } catch (ex) {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
