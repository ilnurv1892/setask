import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/task_repository.dart';

class UserRepositoryIml extends UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future storeNewUser(UserModel user) async {
    try {
      var doc = await FirebaseFirestore.instance.collection('users').doc(user.id);

      await doc.get().then((value) {
        if (!value.exists) {
          doc.set(
            <String, dynamic>{
              'name': user.name ?? 'unnamed',
              'email': user.email,
              'pts': user.pts ?? "1000",
              'team_id': user.team_id ?? "qwerty",
            },
            SetOptions(merge: true),
          );
        }
      });
    } catch (ex) {
      print('EXCEPTION' + ex.toString());
    }
  }

  Future<UserModel> retrieveUserData(String? id) async {
    final querySnapshot = await _db.collection('users').doc(id).get();
    final user = UserModel.fromDocumentSnapshot(querySnapshot);
    final teamSnapshot = await _db.collection('team').doc(user.team_id).get();

    return user.copyWith(team_members: TeamModel.fromDocumentSnapshot(teamSnapshot).users);
  }
}
