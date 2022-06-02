import 'package:flutter/material.dart';
import 'package:protest/screen/select.dart';
import 'package:protest/screen/welcome_page.dart';
import 'package:protest/screen/wrapper.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async{
    await Future.delayed(Duration(milliseconds: 2500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Wheeler',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold) ),
        ),
      ),
    );
  }
}
