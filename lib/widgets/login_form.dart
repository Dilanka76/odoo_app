
import 'package:flutter/material.dart';
import 'package:odoo_app/constant/colors.dart';
import 'package:odoo_app/widgets/reuserble%20widget/formTextField_widget.dart';
import 'package:odoo_app/widgets/reuserble%20widget/tap_button.dart';
import '../models/user_data_model.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  TextEditingController userName =TextEditingController();
  TextEditingController password =TextEditingController();

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    //get userData object
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset("assets/loginImage.png"),
            FormTextField(
              controller:userName,
              lable: "User Name",
              type: FormTextFieldType.text,
            ),
            SizedBox(height: 20,),
            FormTextField(
              controller:password,
              lable: "Password",
              type: FormTextFieldType.password,
            ),
            TapButton(
              lable: "Sing In",
              btnColor: mainColor,
              onPressed: ()async{
                loginFun(userName : "admin" , password: "M4BNgeKEFwzJy5V");
              },
            )
          ],
        ),
      ),
    );
  }
loginFun({required String userName , required String password})async{
  final OdooService odooService = await OdooService(
    url: 'https://skmjcdev-fluttertest-main-19184952.dev.odoo.com/xmlrpc/2/common',
    db: 'skmjcdev-fluttertest-main-19184952',
    username: 'admin',
    password: 'M4BNgeKEFwzJy5V',
  );
  final int uid = await odooService.authenticate();
  print('66666666666666666....................$uid');
}
//     print("hgfdfghjhgh");
//    UserDataModel userData = await UserDataModel(
//        url: "https://skmjcdev-fluttertest-main-19184952.dev.odoo.com/xmlrpc/2/common",
//        dataBase: " skmjcdev-fluttertest-main-19184952",
//        userName: userName,
//        password: password);
//
//       userData.getUserId();
//
// }
}
