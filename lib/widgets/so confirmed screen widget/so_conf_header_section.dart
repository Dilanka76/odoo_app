import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odoo_app/widgets/reuserble%20widget/tap_button.dart';

import '../../constant/colors.dart';

class SoConfHeader extends StatelessWidget {
  const SoConfHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        TapButton(
          lable: "New",
          btnColor: mainColor,
          circularRadius: 3.0,
          fontSize: 20.0,
          onPressed: ()async{
          },
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quataion',style: TextStyle(fontSize: 20),),
            Text('s12222',style: TextStyle(fontSize: 20),),
          ],
        ),
        IconButton(
            onPressed: (){

            }, icon:Icon(Icons.settings)),
        SizedBox(width: 70,),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 45),
          child: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all( // Outline border
                  color: Colors.black, // Border color
                  width: 1, // Border thickness
                ),
              ),
              child: Text('Quataion'),
            ),
            SizedBox(height: 5,),
            Container(
              decoration: BoxDecoration(
                border: Border.all( // Outline border
                  color: Colors.black, // Border color
                  width: 1, // Border thickness
                ),
              ),
              child: Text('Quataion Sent'),
            ),
            SizedBox(height: 5,),
            Container(
              decoration: BoxDecoration(
                border: Border.all( // Outline border
                  color: Colors.black, // Border color
                  width: 1, // Border thickness
                ),
              ),
              child: Text('Sales Order'),
            ),
          ],
        )
      ],
    );
  }
}
