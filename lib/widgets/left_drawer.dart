import 'package:flutter/cupertino.dart';
import 'package:odoo_app/constant/colors.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor.withOpacity(0.3),
          child: ListView(
            children: [
              cartContainerDesign("Sales", ),
              cartContainerDesign("Orders"),
              cartContainerDesign("To Invoice"),
              cartContainerDesign("Products"),
              cartContainerDesign("Reporting"),
              cartContainerDesign("Configuration"),
            ],
          )
    );
  }
}
Widget cartContainerDesign (lable) {
  return Container(
    height:50,
    decoration:BoxDecoration(
    color: lable == "Sales" ? mainColor.withOpacity(0.2):null,
      border: Border.all(
        color: mainColor,
        width: 1
      )
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(lable,style: TextStyle(fontWeight:FontWeight.w700,fontSize: 30),),
    )
  );
}