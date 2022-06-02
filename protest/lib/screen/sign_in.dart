import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:protest/screen/sign_up.dart';
import 'package:protest/screen/utils/colors.dart';

import '../reusable_widget/reusable.dart';
import 'home.dart';

class SignIn extends StatefulWidget {

  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

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
              80, MediaQuery.of(context).size.height * 0.2, 80, 100
          ),
          child: Column(
            children: <Widget>[
              logoWidget('assets/images/icon.png'),
              SizedBox(
                height: 30,
              ),
              reusableTextField("Enter UserName", Icons.person_outline, false, _emailTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
              SizedBox(
                height: 20,
              ),
              signButton(context, true, (){
                FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text).then((value) => {Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()))})
                    .onError((error, stackTrace) => {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("Error"),
                      content: Text("Invalid Username/Password"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text("try again"),
                        ),
                      ],
                    ),


                  )});



              }),
              signUp()
            ],
          ),
        ),
      ),
    ),);
  }
  Row signUp(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?",
            style: TextStyle(color:  Colors.white70)),
        GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => SignUp()));
          },
          child: const Text("Sign Up",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
          ),
        )
      ],
    );
  }

}