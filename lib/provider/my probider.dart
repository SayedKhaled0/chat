
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../Databaseutils/databaseutils.dart';
import '../models/my_user.dart';

class MyProvider extends ChangeNotifier{
  Myuser? myuser;
  User? firebaseUser;
  MyProvider(){
    firebaseUser=FirebaseAuth.instance.currentUser!;
    if(firebaseUser!=null) {
      initMyUser();
    }
  }
  void initMyUser()async{
    myuser=await DatabaseUtils.readUserFromFirestore(firebaseUser?.uid??"");
  }
}
