import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:protest/screen/sign_up.dart';
import 'package:protest/screen/utils/colors.dart';

import '../reusable_widget/reusable.dart';
import 'map_s.dart';


class Fuel extends StatefulWidget {

  const Fuel({Key? key}) : super(key: key);

  @override
  State<Fuel> createState() => _FuelState();
}

class _FuelState extends State<Fuel> {
  final items = ['Petrol', 'Diesel'];
  String? selectedItem = 'Petrol';
  TextEditingController _amountTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      decoration: BoxDecoration(gradient: LinearGradient(colors: [
        hexStringToColor("000000"),
        hexStringToColor("000000"),
        hexStringToColor("000000")
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              80, MediaQuery
              .of(context)
              .size
              .height * 0.2, 80, 120
          ),
          child: Column(
            children: <Widget>[
              logoWidget('assets/images/fuel.png'),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 240,
              child: DropdownButton<String>(
                  value: selectedItem, items: items.map((item) =>
                  DropdownMenuItem(
                      value: item,
                      child: Text(item, style: TextStyle(fontSize: 24,color: Colors.yellow),)))
                  .toList(),
                  onChanged: (item) => setState(() => selectedItem = item)

              ),
              ),



              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter the quantity", Icons.accessibility_new, false, _amountTextController),
              SizedBox(
                height: 20,
              ),

              nButton(context, false, (){

                final amount=_amountTextController.text;

                createUser(amount: amount,fuelType: "petrol",location: "GetLocation");
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("Request made"),
                      content: Text("You will be contacted by the nearby fuel station"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MapS()));
                          },
                          child: Text("Show Map"),
                        ),
                      ],
                    ),
                  );





              }),



            ],
          ),
        ),
      ),
    ),);
  }

  Future createUser({required String amount,required String fuelType,required String location}) async{

    final docUser =FirebaseFirestore.instance.collection('request').doc();
    final json = {
      'amount': amount,
      'fuelType': fuelType,
      'location': location
    };
    await docUser.set(json);



  }
}