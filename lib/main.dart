import 'package:flutter/material.dart';
import 'feature/presentation/pages/splace_page/splace.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home:Scaffold(
         body: ShowCaseWidget(
            builder: Builder(
              builder : (context) => const SlpacePage(),
            )
         ),
       ),

    );
  }
}
