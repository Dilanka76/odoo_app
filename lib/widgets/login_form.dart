import 'package:flutter/material.dart';
import 'package:odoo_app/constant/colors.dart';
import 'package:odoo_app/widgets/reuserble%20widget/formTextField_widget.dart';
import 'package:odoo_app/widgets/reuserble%20widget/tap_button.dart';
import 'package:provider/provider.dart';
import '../constant/sizes.dart';
import '../providers/user_data.provider.dart';
import '../screens/sales_order_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataProvider>(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset("assets/loginImage.png"),
            FormTextField(
              controller: userName,
              lable: "User Name",
              type: FormTextFieldType.text,
            ),
            SizedBox(height: 20,),
            FormTextField(
              controller: password,
              lable: "Password",
              type: FormTextFieldType.password,
            ),
            TapButton(
              lable: "Sign In",
              btnColor: mainColor,
              fontSize: txtNormal,
              width: 50,
              height: 40,
              onPressed: () async {
                FocusScope.of(context).unfocus();
                if (userName.text.trim().isEmpty || password.text.trim().isEmpty) {
                  _showSnackbar(context, "isFailed", "⚠️ Please fill your username and password ");
                  return;
                }else{
                  loginFun(context2: context,
                      userData: userData,
                      userNames: userName.text,
                      passwords: password.text);
                }
                // loginFun(context2:context,userData:userData,userName : "admin" , password: "M4BNgeKEFwzJy5V");
              },
            )
          ],
        ),
      ),
    );
  }

  loginFun({required BuildContext context2, required String userNames, required String passwords, required UserDataProvider userData}) async {
    showDialog(
      context: context2,
      barrierDismissible: false,
      builder: (context) {
        return Center(child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(mainColor),));
      },
    );
    Provider.of<UserDataProvider>(context, listen: false).setUserData(
      url: 'https://skmjcdev-fluttertest-main-19184952.dev.odoo.com/',
      database: "skmjcdev-fluttertest-main-19184952",
      userName: userNames,
      password: passwords,
    );

      await userData.fetchUserId(context2);
    final int userId = userData.userId;
    Navigator.pop(context2);
    if (userId != -1) {
      FocusScope.of(context).unfocus();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SalesOrderScreen()),
      );
    }
  }
  void _showSnackbar(BuildContext context,String status , String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
        backgroundColor: status ==  "isSuccessful" ? Colors.greenAccent : Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

}
