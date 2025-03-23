import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SoConfCstomer extends StatefulWidget {
  final String number;
   SoConfCstomer({super.key, required this.number});

  @override
  State<SoConfCstomer> createState() => _SoConfCstomerState();
}

class _SoConfCstomerState extends State<SoConfCstomer> {
  String selectedValue = 'Test Customer';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.number,style: TextStyle(fontSize: 50),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: selectedValue,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
              items: <String>['Test Customer', 'Administrator', 'My Company']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Expiration - 20/04/2025  ',style: TextStyle(fontSize: 20),),
                  Text('Payment Terms - Immediate',style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          ],
        ),

      ],
    );
  }
}
