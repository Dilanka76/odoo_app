import 'package:flutter/material.dart';
import 'package:odoo_app/providers/user_data.provider.dart';
import 'package:odoo_app/screens/home_page.dart';
import 'package:provider/provider.dart';

import 'constant/colors.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserDataProvider(),
      child: MyApp(),
    ),
  );
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

