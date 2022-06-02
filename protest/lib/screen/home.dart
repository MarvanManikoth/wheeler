import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:protest/fuel.dart';
import 'package:protest/screen/sign_in.dart';
import 'package:protest/screen/utils/colors.dart';

import '../mec.dart';
import '../reusable_widget/img_res.dart';
import '../reusable_widget/img_res2.dart';
import '../reusable_widget/img_res3.dart';
import '../tow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [hexStringToColor("000000"),
    hexStringToColor("000000"),
    hexStringToColor("000000")
    ],begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    child: SingleChildScrollView(
    child: Padding(
    padding: EdgeInsets.fromLTRB(
    80, MediaQuery.of(context).size.height * 0.2,80, 200
    ),
    child: Center(
      child: Column(
      children: [

        GestureDetector(
          onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => Fuel()));},
          child: Container(
              width: 200,
              child: ResponsiveImage()),
        ),

        SizedBox(
          height: 20,
        ),

        GestureDetector(
          onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => Mec()));},
          child: Container(
              width: 200,
              child: ResponsiveImage2(width: 120)),
        ),

        SizedBox(
          height: 20,
        ),

        GestureDetector(
          onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => Tow()));},
          child: Container(
              width: 200,
              child: ResponsiveImage3(width: 120)),
        ),

        SizedBox(
          height: 80,
        ),


        ElevatedButton(
          child: Text('Log Out',style: TextStyle(
            color: Colors.black,
          ),),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));});

            },
          style: ElevatedButton.styleFrom(
              primary: Colors.yellow,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ),








        ]),
    ),
    ))
        )
    );
  }
}

