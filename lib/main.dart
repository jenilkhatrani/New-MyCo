import 'package:flutter/material.dart';
import 'package:new_myco/lost_and_found/add_screen.dart';
import 'package:new_myco/screen/home_page.dart';
import 'package:new_myco/screen/pie_chart_page.dart';

import 'lost_and_found/lost_and_found.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
