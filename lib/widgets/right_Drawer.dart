import 'package:flutter/cupertino.dart';
import 'package:odoo_app/constant/colors.dart';

class RightDrawer extends StatelessWidget {
  const RightDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: mainColor.withOpacity(0.3),
        child: ListView(
          children: [
            cartContainerDesign("Documentaion",),
            cartContainerDesign("Support"),
            cartContainerDesign("Shortcuts"),
            cartContainerDesign("Dark Mood"),
            cartContainerDesign("Onboarding"),
            cartContainerDesign("Preference"),
            cartContainerDesign("My Odoo.com account"),
            cartContainerDesign("Install App"),
            cartContainerDesign("Log Out"),
          ],
        )
    );
  }
}
Widget cartContainerDesign (lable) {
  return Container(
      height:50,
      decoration:BoxDecoration(
          border: Border.all(
              color: mainColor,
              width: 0.5,
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(lable,style: TextStyle(fontWeight:FontWeight.w700,fontSize: 30),),
      )
  );
}