import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room/models/my_user.dart';
import 'package:room/provider/my%20probider.dart';

import '../../base.dart';
import '../home/home_view.dart';
import '../login_screen/login_view.dart';
import 'create_account_nav.dart';
import 'create_account_viewmodel.dart';

class CreateAccount extends  StatefulWidget {
static const String routeName="CreateAccount";

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends BaseView<CreateAccount, CreateAccountViewModel>
    implements CreateAccountNavigator {
GlobalKey<FormState> formKey = GlobalKey<FormState>();

var emailController = TextEditingController();

var passwordController = TextEditingController();

var firNameController = TextEditingController();

var useNameController = TextEditingController();

CreateAccountViewModel viewModel = CreateAccountViewModel();
@override
void initState() {
  // TODO: implement initState
  super.initState();
  viewModel.navigator = this;
}


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>viewModel,
      child: Stack(

        children: [
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
              title: Text("ChatApp"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    TextFormField(
                      controller: firNameController,
                      validator: (text) {
                        if (text!.trim() == "") {
                          return "Plase Enter First Name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "First Name",
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
                    TextFormField(
                      controller: useNameController,
                      validator: (text) {
                        if (text!.trim() == "") {
                          return "Plase Enter User Name";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "User Name",
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
                    TextFormField(
                      validator: (text) {
                        if (text!.trim() == "") {
                          return "Plase Enter Email";
                        }
                        final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return "Plase Enter Valid Email";
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
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
                    TextFormField(
                      validator: (text) {
                        if (text!.trim() == "") {
                          return "Plase Enter Password";
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: " Password",
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
                      style:ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                        )
                      ),

                        onPressed: () {
                          CreateAccountt();
                        },
                        child: Text("Create Account",),

                    ),
                    TextButton(
                        onPressed:(){
                          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                        }, child: Text("I Have An Account"))


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

void CreateAccountt()async{
  if (formKey.currentState!.validate()){
    viewModel.createAccountWithFirbaseAuth(firNameController.text,useNameController.text,emailController.text, passwordController.text);


  }

}

  @override
  CreateAccountViewModel initViewModel() {
    return CreateAccountViewModel();
  }

  @override
  void goToHome(Myuser myuser) {
  // var provider=Provider.of<MyProvider>(context,listen: false);
Navigator.pushReplacementNamed(context,HomeScreen.routeName);
}
}



