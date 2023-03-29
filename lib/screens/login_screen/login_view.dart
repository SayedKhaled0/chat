
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room/models/my_user.dart';

import '../../base.dart';
import '../../provider/my probider.dart';
import '../create_account/create_account.dart';
import '../home/home_view.dart';
import 'login_navigator.dart';
import 'login_view_model.dart';



class LoginScreen extends StatefulWidget {

  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseView<LoginScreen, LoginViewModel>
    implements LoginNavigator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
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
              title: Text("Login"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      validator: (text) {
                        if (text!.trim() == "") {
                          return "Plase Enter Email";
                        }
                        return null;
                      },
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
                      controller: passwordController,
                      textInputAction: TextInputAction.done,
                      validator: (text) {
                        if (text!.trim() == "") {
                          return "Plase Enter Password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
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
                          ValidataForm();
                        },
                        child: Text("Login")),
                    TextButton(
                        onPressed:(){
                          Navigator.pushReplacementNamed(context, CreateAccount.routeName);
                        }, child: Text("Don't Have An Account?"))

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void ValidataForm (){
    viewModel.loginWithFirbaseAuth(emailController.text, passwordController.text);
  }

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }

  @override
  void goToHome(Myuser myuser) {
    // var provider=Provider.of<MyProvider>(context,listen: false);

   Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}


