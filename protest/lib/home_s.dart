import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:protest/screen/sign_in.dart';
import 'package:protest/screen/utils/colors.dart';
import 'package:protest/sign_in_service.dart';

import '../reusable_widget/img_res.dart';
import '../reusable_widget/img_res2.dart';
import '../reusable_widget/img_res3.dart';

class HomeScreenS extends StatefulWidget {
  const HomeScreenS({Key? key}) : super(key: key);

  @override
  State<HomeScreenS> createState() => _HomeScreenSState();
}

class _HomeScreenSState extends State<HomeScreenS> {
  final Stream<QuerySnapshot> users = FirebaseFirestore.instance.collection('request').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Request'),
        ),
        body: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [hexStringToColor("000000"),
      hexStringToColor("000000"),
      hexStringToColor("000000")
    ],begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  80, MediaQuery.of(context).size.height * 0.2,80, 500
              ),
              child: Center(
                child: Column(
                    children: [

                      StreamBuilder<QuerySnapshot>(stream: users, builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
                        if(snapshot.hasError){
                          return Text('something went wrong');
                        }
                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Text('loading');
                        }
                        final data=snapshot.requireData;
                        return ListView.builder(
                          itemCount: data.size,
                          itemBuilder: (context,index){
                            return Text('user request ${data.docs[index]['amount']} liter ${data.docs[index]['fuelType'] } at ${data.docs[index]['location'] } ');
                          },
                        );
                      },),

                      ElevatedButton(onPressed: () {
                        FirebaseAuth.instance.signOut().then((value) {Navigator.push(context, MaterialPageRoute(builder: (context) => SignInSer()));});

                      }, child: Text("Logout"),

                      ), ]

                ),
              ),
            ))
    )
    );



    }

}

