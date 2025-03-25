
import 'package:flutter/material.dart';
import 'package:odoo_app/constant/colors.dart';
import 'package:odoo_app/models%20data/drawer_data.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    LeftDrawerData leftDrawerData = LeftDrawerData();
    return Container(
      color: mainColor.withOpacity(0.3),
      child: ListView.builder(
        itemCount: leftDrawerData.leftDrawerDataList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = leftDrawerData.leftDrawerDataList[index];
          return cartContainerDesign(item.itemName,item.Icon);
        },
      ),
    );
  }
}
Widget cartContainerDesign (String lable,IconData icon) {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(lable,style: TextStyle(fontWeight:FontWeight.w700,fontSize: 25),),
          IconButton(onPressed: (){
          }, icon: Icon(icon))
        ],
      ),
    )
  );
}