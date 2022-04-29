import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:domain/task_repository.dart';

class TaskRepositoryImpl extends TaskRepository {
  /// {@macro task_data_api}
  TaskRepositoryImpl();

  @override
  Stream<List<TaskModel>> getTaskList() {
    final collection = FirebaseFirestore.instance.collection('tasks');

    final list = collection.snapshots().map((snapshot) {
      return snapshot.docs.map(TaskModel.fromMap).toList();
    });

    return list;
  }
}
