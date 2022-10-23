import 'package:flutter/material.dart';

import 'feature/presentation/pages/burte_force_page/bruth_force_page.dart';
import 'feature/presentation/pages/directory_search_page/directory_search_page.dart';
import 'feature/presentation/pages/homepage/home_page.dart';
import 'feature/presentation/pages/path_traversal_page/path_traversal_page.dart';
import 'feature/presentation/pages/simple_test_page/simple_text_page.dart';
import 'feature/presentation/pages/splace_page/splace.dart';

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
home: const SlpacePage(),
    );
  }
}
