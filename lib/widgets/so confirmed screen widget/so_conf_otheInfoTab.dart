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
                Text("SALES",style: TextStyle(fontWeight: FontWeight.w800),),
                Text('Sales Person'),
                Text('Sales Team'),
                Text('Online Signature'),
                Text('Online Payment'),
                Text('Customer Referance'),
                Text('Tags'),
                Text('Shipping'),
                Text('Delivery Date'),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("INVOICING",style: TextStyle(fontWeight: FontWeight.w800),),
                Text('Fiscal Position'),
                Text('Tracking'),
                Text('Source Documents'),
                Text('Campaign'),
                Text('Medium'),
                Text('Source'),
              ],
            ),
        ],
    );
  }
}
