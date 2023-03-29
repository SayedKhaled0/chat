import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:room/models/category.dart';

import '../models/my_user.dart';
import '../models/room.dart';

class DatabaseUtils{
 static CollectionReference<Myuser>getUsersCollection(){
    return FirebaseFirestore.instance.collection(Myuser.COLLECTIONNAME)
    .withConverter<Myuser>(fromFirestore: (snapshot,optons)=>
        Myuser.fromJson(snapshot.data()!),
        toFirestore: (myuser,options)=>myuser.toJson(),);
  }
 static CollectionReference<Room>getRoomsCollection(){
   return FirebaseFirestore.instance.collection(Room.COLLECTIONNAME)
       .withConverter<Room>(fromFirestore: (snapshot,optons)=>
       Room.fromJson(snapshot.data()!),
     toFirestore: (room,options)=>room.toJson(),);
 }
 static Future<void> AddRoomToFirestore(Room room){
   var colection=getRoomsCollection();
   var docRef=colection.doc();
   room.id=docRef.id;
   return docRef.set(room);
 }
  static Future <void> AddUserToFirestore(Myuser myuser){
    return getUsersCollection().doc(myuser.id).set(myuser);
  }
static Future<Myuser?> readUserFromFirestore(String id)async{
    DocumentSnapshot<Myuser>user=
        await getUsersCollection().doc(id).get();
    var myUser=user.data();
    return myUser;
  }
}