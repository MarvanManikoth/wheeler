
import 'package:flutter/material.dart';

class ResponsiveImage extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveImage({Key? key,this.width,this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/fuel.png")
        ],
      ),
    );
  }
}

