import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_task_data_api/firebase_task_data_api.dart';

class TaskDataApi extends TaskApi {
  /// {@macro task_data_api}
  TaskDataApi();

  @override
  Stream<List<Task>> getTask() {
    final collection = FirebaseFirestore.instance.collection('tasks');

    final list = collection.snapshots().map((snapshot) {
      return snapshot.docs.map(Task.fromMap).toList();
    });

    return list;
  }
}
