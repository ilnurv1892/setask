import 'package:domain/task_repository.dart';

abstract class UserRepository {
  Future<UserModel> retrieveUserData(String? id);
  Future storeNewUser(UserModel user);
}
