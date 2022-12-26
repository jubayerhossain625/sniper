import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget loder(){
  return Center(
    child: SizedBox(height: 200,width:200,
      child:  Lottie.asset('assets/lottie/getres.json'),
    )
  );
}

Widget simpleLoader(String path){
  return Center(
      child: SizedBox(height: 200,width:200,
        child:  Lottie.asset(path),
      )
  );
}