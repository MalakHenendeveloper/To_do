import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do/data/taskModel.dart';

class Fierbasedata {
  static CollectionReference<Tasks> gettaskcollection() {
    return FirebaseFirestore.instance.collection('Tasks').withConverter<Tasks>(
        fromFirestore: (snapshot, options) =>
            Tasks.fromfirestore(snapshot.data()!),
        toFirestore: (task, options) => task.toFireTore());
  }

  static Future<void> addtask(Tasks task) {
    var taskcollection = gettaskcollection();
    var taskdocs = taskcollection.doc();
    task.id = taskdocs.id;

    return taskdocs.set(task);
  }

  static Stream<List<Tasks>> getallcollections() {
    return gettaskcollection().snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  static Future<void> deleteTask(Tasks task) {
    return gettaskcollection().doc(task.id).delete();
  }
  static Future<void> updateTask(Tasks task) async {
    await gettaskcollection().doc(task.id).update(task.toFireTore());
  }
}
