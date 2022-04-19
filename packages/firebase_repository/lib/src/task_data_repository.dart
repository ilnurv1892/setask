import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_repository/src/models/task_model.dart';
import 'package:firebase_repository/src/task_api.dart';

class TaskDataApi extends TaskApi {
  /// {@macro task_data_api}
  TaskDataApi();

  @override
  Stream<List<TaskModel>> getTask() {
    final collection = FirebaseFirestore.instance.collection('tasks');

    final list = collection.snapshots().map((snapshot) {
      return snapshot.docs.map(TaskModel.fromMap).toList();
    });

    return list;
  }
}
