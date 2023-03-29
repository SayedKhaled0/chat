// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import '../../../models/tasks.dart';
//
// CollectionReference<TaskData> getTasksCollection() {
//   return FirebaseFirestore.instance.collection("tasks").withConverter<TaskData>(
//       fromFirestore: (snapshot, sp) => TaskData.fromJson(snapshot.data()!),
//       toFirestore: (task, sp) => task.toJason());
// }
//
// Future<void> addTasekFirebaseFirestore(TaskData taskData) {
//   var collection = getTasksCollection();
//   var docref = collection.doc();
//   taskData.id = docref.id;
//
//   return docref.set(taskData);
// }
// Stream<QuerySnapshot<TaskData>>getTasksFromFirestore(DateTime dateTime){
//   return getTasksCollection().where
//     ("data",isEqualTo:DateUtils.dateOnly(dateTime).microsecondsSinceEpoch).snapshots();
// }
// Future<void> deleteTaskFirestore(String id){
//  return getTasksCollection().doc(id).delete();
// }
// Future<void> editIsDoneInfirebase(TaskData taskData){
//   return getTasksCollection().doc(taskData.id).update({
//   "isdone":taskData.isdone,
//   });
// }
// Future<void> updateTaskFirestore(String id,String title,String description,int date){
//   return getTasksCollection().doc(id).update({
//     "title":title,
//     "description":description,
//     "date":date,
//   });
// }