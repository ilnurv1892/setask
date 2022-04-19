part of 'user_bloc.dart';

abstract class UserEvents extends Equatable {}

class FetchEvent extends UserEvents {
  FetchEvent(this.userModel);
  final UserModel userModel;
  @override
  List<UserModel?> get props => [userModel];
}

class CreateEvent extends UserEvents {
  CreateEvent(this.userModel);

  final UserModel userModel;
  @override
  List<UserModel?> get props => [userModel];
}
