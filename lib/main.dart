import 'package:flutter/material.dart';
import 'package:odoo_app/screens/home_page.dart';

import 'constant/colors.dart';

void main(){
  runApp(
    const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Odoo Orders App',
      theme: ThemeData(
        primaryColor: mainColor,
        colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
      ),
      home: const MyHomePage(),
    );
  }
}

