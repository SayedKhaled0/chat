import 'package:firebase_auth/firebase_auth.dart';
import 'package:room/base.dart';

import '../../Databaseutils/databaseutils.dart';
import '../../models/my_user.dart';
import '../../shared/components/firebase errors.dart';
import 'login_navigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  String message = "";

  void loginWithFirbaseAuth(String email, String password) async {
    try {
      navigator!.showLoading();
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password:password,
      );
      message="Successfully logged";
      Myuser? myuser=await DatabaseUtils.readUserFromFirestore(credential.user?.uid??"");
      if(myuser!=null) {
        navigator!.hideLoading();
        navigator!.goToHome(myuser);
        return;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseError.weakPassword) {
        message='wrong email or password';

      }
    } catch (e) {
      message='Something went wrong $e';


    }
    if(message!=""){
      navigator!.hideLoading();
      navigator!.showMessage(message);
    }

  }
}