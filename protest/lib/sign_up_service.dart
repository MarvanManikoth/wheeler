import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:protest/screen/home.dart';
import 'package:protest/screen/utils/colors.dart';
import '../reusable_widget/reusable.dart';
import 'home_s.dart';

class SignUpSer extends StatefulWidget {
  const SignUpSer({Key? key}) : super(key: key);

  @override
  State<SignUpSer> createState() => _SignUpSerState();
}

class _SignUpSerState extends State<SignUpSer> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _mobileTextController = TextEditingController();

  final controller = TextEditingController();

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
              reusableTextField("Enter UserName", Icons.person_outline, false, controller),
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
                final name = controller.text;
                final mail=_emailTextController.text;
                final mobile=_mobileTextController.text;

                createUser(name: name,mail: mail,mobile: mobile);
                FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text,
                    password: _passwordTextController.text).then((value){Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreenS()));
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
  Future createUser({required String name,required String mail,required String mobile}) async{

    final docUser =FirebaseFirestore.instance.collection('users').doc();
    final json = {
      'name': name,
      'email': mail,
      'mobile': mobile
    };
    await docUser.set(json);



  }

}






