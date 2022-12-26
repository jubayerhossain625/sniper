import 'dart:ui';

import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
   CustomBox({Key? key,required this.widget}) : super(key: key);
   Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width:  double.infinity,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: widget
      ),

      decoration:   const BoxDecoration(
        color: Colors.deepOrange,
        image: DecorationImage(image: AssetImage('assets/bg.jpeg',),fit: BoxFit.cover,),
        gradient:LinearGradient(
            colors: [
              Colors.orange,
              Colors.orangeAccent,
              Colors.red,
              Colors.redAccent
              //add more colors for gradient
            ],
            begin: Alignment.topLeft, //begin of the gradient color
            end: Alignment.bottomRight, //end of the gradient color
            stops: [0, 0.2, 0.5, 0.8] //stops for individual color
          //set the stops number equal to numbers of color
        ),
      ),
    );
  }
}
