import 'package:flutter/cupertino.dart';

class SoConfOtheinfotab extends StatelessWidget {
  const SoConfOtheinfotab({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("SALES",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
                Text('Sales Person',style: TextStyle(fontSize: 20),),
                Text('Sales Team',style: TextStyle(fontSize: 20),),
                Text('Online Signature',style: TextStyle(fontSize: 20),),
                Text('Online Payment',style: TextStyle(fontSize: 20),),
                Text('Customer Referance',style: TextStyle(fontSize: 20),),
                Text('Tags',style: TextStyle(fontSize: 20),),
                Text('Shipping',style: TextStyle(fontSize: 20),),
                Text('Delivery Date',style: TextStyle(fontSize: 20),),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("INVOICING",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
                Text('Fiscal Position',style: TextStyle(fontSize: 20),),
                Text('Tracking',style: TextStyle(fontSize: 20),),
                Text('Source Documents',style: TextStyle(fontSize: 20),),
                Text('Campaign',style: TextStyle(fontSize: 20),),
                Text('Medium',style: TextStyle(fontSize: 20),),
                Text('Source',style: TextStyle(fontSize: 20),),
              ],
            ),
        ],
    );
  }
}
