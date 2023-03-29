import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:room/screens/add_rooms/add_room_view.dart';
import 'package:room/screens/create_account/create_account.dart';
import 'package:room/screens/home/home_view.dart';
import 'package:room/screens/login_screen/login_view.dart';

import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:CreateAccount.routeName ,
      routes: {
        CreateAccount.routeName:(_)=>CreateAccount(),
        LoginScreen.routeName:(_)=>LoginScreen(),
        HomeScreen.routeName:(_)=>HomeScreen(),
        AddRoomScreen.routeName:(_)=>AddRoomScreen(),
      },
      debugShowCheckedModeBanner: false,

    );
  }
}



