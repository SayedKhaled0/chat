import 'package:room/Databaseutils/databaseutils.dart';
import 'package:room/base.dart';
import 'package:room/models/room.dart';

import 'add_room_navigator.dart';

class AddRoomViewModel extends BaseViewModel<AddRoomNavigator>{
  void AddRoomToDB(String title,String desc,String catId ){
    Room room=Room( title: title, desc: desc, catId: catId);
    DatabaseUtils.AddRoomToFirestore(room).then((value) {
      print("Room Add");

    }).catchError((error){

    });


  }

}