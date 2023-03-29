import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:room/base.dart';
import 'package:room/screens/home/home_navigator.dart';
import 'package:room/screens/home/home_view_model.dart';

import '../add_rooms/add_room_view.dart';
import '../login_screen/login_view.dart';

class HomeScreen extends StatefulWidget {
static const String routeName="home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen,HomeViewModel>implements HomeNavigetor {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator=this;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.pushNamed(context, AddRoomScreen.routeName);
        } ,
        child: Icon(Icons.add,color: Colors.white,),
      ),
      appBar: AppBar(
        title: Text("Rooms_App"),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);
              },
              icon: Icon(Icons.logout))
        ],


      ),
      body: Container(),
    );
  }

  @override
  HomeViewModel initViewModel() {
    // TODO: implement initViewModel
   return HomeViewModel();
  }
}
