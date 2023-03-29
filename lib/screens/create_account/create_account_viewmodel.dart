import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../Databaseutils/databaseutils.dart';
import '../../base.dart';
import '../../models/my_user.dart';
import '../../shared/components/firebase errors.dart';
import 'create_account_nav.dart';

class CreateAccountViewModel extends BaseViewModel <CreateAccountNavigator>{
  String message="";
  void createAccountWithFirbaseAuth(String email,String password,String firstName,String userName)async{
    try {
      print("try1");
      navigator!.showLoading();
      print("try1");


      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("try2");
      message = "Account Created";
      Myuser myuser = Myuser(id: credential.user?.uid ?? "",
          email: email,
          firName: firstName,
          userName: userName);
      await DatabaseUtils.AddUserToFirestore(myuser).then((value) {
       print("sateeeeeellll");

        navigator!.hideLoading();
        navigator!.goToHome(myuser);
        return;
      });
     print("sssssssssssss+++");

    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseError.weakPassword) {
        message='The password provided is too weak.';
        print("$e");

      } else if (e.code == FirebaseError.emailInUse) {
        message='The account already exists for that email.';
        print("$e");

      }
    } catch (e) {
      message='Something went wrong $e';
      print("$e");
    }
    if(message!=""){
      navigator!.hideLoading();
      navigator!.showMessage(message);
    }
  }

}