import 'package:flutter/cupertino.dart';
import 'package:odoo_app/widgets/reuserble%20widget/tap_button.dart';

import '../../constant/colors.dart';

class SoConfAction extends StatelessWidget {
  const SoConfAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TapButton(
            lable: "Send Email",
            btnColor: mainColor,
            circularRadius: 10.0,
            fontSize: 7.0,
            onPressed: ()async{
            },
          ),
        ),
        Expanded(
          child: TapButton(
            lable: "Confirmed",
            btnColor: mainColor,
            circularRadius: 10.0,
            fontSize: 7.0,
            onPressed: ()async{
            },
          ),
        ),
        Expanded(
          child: TapButton(
            lable: "Preview",
            btnColor: mainColor,
            circularRadius: 10.0,
            fontSize: 7.0,
            onPressed: ()async{
            },
          ),
        ),
        Expanded(
          child: TapButton(
            lable: "Cancel",
            btnColor: mainColor,
            circularRadius: 10.0,
            fontSize: 7.0,
            onPressed: ()async{
            },
          ),
        ),
      ],
    );
  }
}
