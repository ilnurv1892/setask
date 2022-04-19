part of 'user_bloc.dart';

enum Status { initial, loading, saved, fetched, failure }

class UserState extends Equatable {
  final UserModel user;
  final Status status;

  UserState(this.user, {this.status = Status.initial});

  UserState copyWith({Status? status, UserModel? user}) {
    return UserState(user ?? this.user, status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}
