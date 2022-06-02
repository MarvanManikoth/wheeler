import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protest/screen/utils/colors.dart';

import '../reusable_widget/reusable.dart';
import 'home.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _mobileTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [
      hexStringToColor("000000"),
      hexStringToColor("000000"),
      hexStringToColor("000000")
    ],begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, 120, 20, 220
          ),
          child: Column(
            children: <Widget>[

              SizedBox(
                height: 30,
              ),
              reusableTextField("Enter UserName", Icons.person_outline, false, _userNameTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Email Id", Icons.person_outline, false, _emailTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Mobile Number ", Icons.phone, false, _mobileTextController),
              SizedBox(
                height: 20,
              ),
              signButton(context, false, (){
                FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text,
                    password: _passwordTextController.text).then((value){Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    }).onError((error, stackTrace){
                      print("error ${error.toString()}");
                });

              }),

            ],
          ),
        ),
      ),
    ),);
  }

}






