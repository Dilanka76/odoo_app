import 'package:flutter/material.dart';
import 'package:lock_orientation_screen/lock_orientation_screen.dart';
import 'package:odoo_app/providers/user_data.provider.dart';
import 'package:odoo_app/screens/home_page.dart';
import 'package:odoo_app/screens/onbording_screen.dart';
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
    return LockOrientation(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Odoo Orders App',
        theme: ThemeData(
          primaryColor: Color(0xFF6A0DAD),
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF6A0DAD)),
        ),
        home: const OnbordingScreen(),
      ),
    );
  }
}

