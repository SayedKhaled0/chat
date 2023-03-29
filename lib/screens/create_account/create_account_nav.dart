import 'package:room/models/my_user.dart';

import '../../base.dart';

abstract class CreateAccountNavigator extends BaseNavigator{
  void goToHome(Myuser myuser);
}