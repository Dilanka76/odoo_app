import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odoo_app/widgets/reuserble%20widget/tap_button.dart';

import '../../constant/colors.dart';

class SoConfHeader extends StatefulWidget {
  final String number;
  final String status;
  const SoConfHeader({super.key,  required this.number, required this.status});

  @override
  State<SoConfHeader> createState() => _SoConfHeaderState();
}

class _SoConfHeaderState extends State<SoConfHeader> {
  String selectedValue = 'Quotation';
  @override
  void initState() {
    selectedValue =  widget.status == "sale" ?'Sales Order' :'Quotation'  ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            TapButton(
              lable: "New",
              btnColor: mainColor,
              fontSize: 20.0,
              width: 50,
              height: 40,
              onPressed: ()async{
              },
            ),
            Text("Quotation",style: TextStyle(fontSize: 20,color: CupertinoColors.activeBlue)),
            Text(widget.number,style: TextStyle(fontSize: 20),),
            IconButton(onPressed: (){}, icon:Icon(Icons.settings)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 170,
              child: RadioListTile<String>(
                title: Text("Quotation"),
                value: "Quotation",
                groupValue: selectedValue,
                onChanged: (value) {
                },
              ),
            ),
            SizedBox(
              width: 190,
              child: RadioListTile<String>(
                title: Text("Quotation Sent"),
                value: "Quotation Sent",
                groupValue: selectedValue,
                onChanged: (value) {
                },
              ),
            ),
            SizedBox(
              width: 170,
              child: RadioListTile<String>(
                title: Text("Sales Order"),
                value: "Sales Order",
                groupValue: selectedValue,
                onChanged: (value) {
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
