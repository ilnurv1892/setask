import 'package:domain/task_repository.dart';

abstract class AuthenticationRepository {
  Stream<UserModel> get user;

  Future<void> signUp({required String email, required String password});
  Future<void> logInWithGoogle();
  Future<void> logInWithEmailAndPassword({required String email, required String password});
  Future<void> logOut();

  UserModel get currentUser;
}
