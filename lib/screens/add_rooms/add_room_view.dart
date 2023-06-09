import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room/base.dart';
import 'package:room/models/category.dart';

import 'add_room_navigator.dart';
import 'add_room_view_model.dart';

class AddRoomScreen extends StatefulWidget {
  static const String routeName = "addroom";

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

class _AddRoomScreenState extends BaseView<AddRoomScreen, AddRoomViewModel>
    implements AddRoomNavigator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var categories=RoomCategory.getCategories();
  late RoomCategory SelectedCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    viewModel.navigator = this;
    SelectedCategory =categories[0];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Stack(children: [
          Image.asset(
            "assets/images/bac.png",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                centerTitle: true,
                title: Text("Add Room"),
              ),
              body: Container(
                margin: EdgeInsets.all(35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white
                ),
                child: Card(
                  elevation: 20,
                  child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Form(
                          key: formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Create New Room",textAlign: TextAlign.center,style:
                                TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                                Image.asset("assets/images/group-1824146_1280.png"),
                                TextFormField(
                                  controller: titleController,
                                  textInputAction: TextInputAction.next,
                                  validator: (text) {
                                    if (text!.trim() == "") {
                                      return "Plase Enter Room Title";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Title",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(color: Colors.blue)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(color: Colors.blue)),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                DropdownButton<RoomCategory>(
                                  value: SelectedCategory,
                                    items: categories.map((cat) =>DropdownMenuItem<RoomCategory>(
                                      value: cat,
                                        child: Row(
                                      children: [
                                        Image.asset(cat.image),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text(cat.name),
                                      ],
                                    ))).toList(),
                                    onChanged:(category){
                                      if(category==null){
                                        return;

                                      }else{
                                        SelectedCategory=category;

                                      }
                                      setState(() {

                                      });


                                    }),
                                SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: descriptionController,
                                  textInputAction: TextInputAction.done,
                                  validator: (text) {
                                    if (text!.trim() == "") {
                                      return "Plase Enter Room Description";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Description",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(color: Colors.blue)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(color: Colors.blue)),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16))),
                                    onPressed: () {
                                      ValidataForm();
                                    },
                                    child: Text("Create Room")),
                              ]))),
                ),
              ))
        ]));
  }
void ValidataForm(){
    if(formKey.currentState!.validate()){
      viewModel.AddRoomToDB(titleController.text, descriptionController.text, SelectedCategory.id);
    };

}
  @override
  AddRoomViewModel initViewModel() {
    // TODO: implement initViewModel
    return AddRoomViewModel();
  }
}
