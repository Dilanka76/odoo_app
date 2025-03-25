import 'package:flutter/material.dart';
import 'package:odoo_app/constant/colors.dart';
import '../widgets/login_form.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainColor,
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width*0.8,
            height: MediaQuery.of(context).size.height*0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: LoginForm()
          ),
        ),
      ),
    );
  }
}
