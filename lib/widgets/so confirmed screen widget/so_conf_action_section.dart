import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odoo_app/providers/user_data.provider.dart';
import 'package:odoo_app/widgets/reuserble%20widget/tap_button.dart';
import 'package:provider/provider.dart';
import 'package:xml_rpc/client.dart' as xml_rpc;
import '../../constant/colors.dart';

class SoConfAction extends StatefulWidget {
  final int orderId;
  final String status;
  const SoConfAction({super.key, required this.orderId, required this.status});
  @override
  State<SoConfAction> createState() => _SoConfActionState();
}

class _SoConfActionState extends State<SoConfAction> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TapButton(
            lable: widget.status == "sale" ? "Create Invoice" : "Send Email",
            btnColor: mainColor,
            width: 50,
            height: 30,
            fontSize: 7,
            onPressed: ()async{
            },
          ),
        ),
        Expanded(
          child: TapButton(
            lable: widget.status == "sale" ? "Send  mail" :"Confirmed",
            btnColor: mainColor,
            width: 50,
            height: 30,
            fontSize: 7.0,
            onPressed: ()async{
                bool  isDone  = await confirmedSalesOrder(
                    userData.url,
                    userData.password,
                    userData.database,
                    userData.userId
                );
                if(widget.status !="sale"){
                  if(isDone){
                    _showSnackbar(context, "isSuccessful" ," Sale Order Confirmed Successfully");
                  }else{
                    _showSnackbar(context, "isFailed" ,"⚠️ Failed to confirm Sale Order");
                  }
                }
            },
          ),
        ),
        Expanded(
          child: TapButton(
            lable: "Preview",
            btnColor: mainColor,
            width: 50,
            height: 30,
            fontSize: 7.0,
            onPressed: ()async{
            },
          ),
        ),
        Expanded(
          child: TapButton(
            lable: "Cancel",
            btnColor: mainColor,
            width: 50,
            height: 30,
            fontSize: 7.0,
            onPressed: ()async{
            },
          ),
        ),
      ],
    );
  }

  // confirmed the sales order
  Future<bool> confirmedSalesOrder(String url , String password, String database, int userId) async {
    try {
      final response = await xml_rpc.call(
        Uri.parse('${url}xmlrpc/2/object'),
        'execute_kw',
        [
          database,
          userId,
          password,
          'sale.order',
          'action_confirm',
          [widget.orderId],
        ],
      );
      print("Sale Order Confirmed Successfully");
      return response;

    } catch (e) {
      return false;
    }
  }
  void _showSnackbar(BuildContext context,String status , String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
        backgroundColor: status ==  "isSuccessful" ? Colors.greenAccent : Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
    if(status ==  "isSuccessful"){
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pop(context,true);
      });
    }
  }

}
