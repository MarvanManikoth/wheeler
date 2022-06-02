import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protest/reusable_widget/app_large_text.dart';
import 'package:protest/reusable_widget/responsive_button.dart';
import 'package:protest/screen/sign_in.dart';
import 'package:protest/screen/sign_up.dart';

import '../reusable_widget/app_text.dart';
import '../sign_in_service.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "back.jpg",
    "back2.jpg"
  ];
  List text1 =[ "Need Help?",
    "Build your business"
  ];
  List text2 =[
    "You are at the right place.",
    "Boost your number of customers"
    ];
  List text3 =[
    "Is your vehicle giving you trouble during the journey? Don't worry you are at the right place. Find the service you require within few clicks."
  ,"Mechanic,fuel or tow services if your are running a business in any of this increase your income.Register as a service provider now "];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/"+images[index]
                  ),
                fit: BoxFit.cover
                )
              ),
            child: Container(
              margin: const EdgeInsets.only(top: 250, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        AppLargeText(text:text1[index] ),
                        AppText(text:text2[index] ,size: 21),
                      SizedBox(height: 20),
                      Container(
                        width: 250,
                        child: AppText(
                          text: text3[index],
                          color: Colors.black,
                          size: 14,
                        ),
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context) => index==0?SignIn():SignInSer()));},
                        child: Container(
                          width: 200,
                          child: ResponsiveButton(width: 120)),
                      )

                    ],
                  ),
                  Column(

                    children: List.generate(2,(indexDots){
                      return Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index==indexDots?25:8,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index==indexDots?Colors.yellow:Colors.black,
                        ),
                      );
                    })

                  )
                ],
              ),
            )
            );
      }),
    );
  }
}
