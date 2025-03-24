
import 'package:flutter/material.dart';
import 'package:odoo_app/providers/user_data.provider.dart';
import 'package:odoo_app/widgets/reuserble%20widget/tap_button.dart';
import 'package:provider/provider.dart';
import 'package:xml_rpc/client.dart' as xml_rpc;
import '../../constant/colors.dart';
import '../../constant/sizes.dart';

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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TapButton(
            lable: widget.status == "sale" ? "Create Invoice" : "Send Email",
            btnColor: mainColor,
            width: 20,
            height: 30,
            fontSize: 20.0,
            onPressed: ()async{
            },
          ),
          TapButton(
            lable: widget.status == "sale" ? "Send  mail" :"Confirmed",
            btnColor: mainColor,
            width: 50,
            height: 30,
            fontSize: 20.0,
            onPressed: ()async{
                if(widget.status !="sale"){
                  ShowdialogPopup(context,userData);
                }
            },
          ),
          TapButton(
            lable: "Preview",
            btnColor: mainColor,
            width: 50,
            height: 30,
            fontSize: 20.0,
            onPressed: ()async{
            },
          ),
          TapButton(
            lable: "Cancel",
            btnColor: mainColor,
            width: 50,
            height: 30,
            fontSize: 20.0,
            onPressed: ()async{
            },
          ),
        ],
      ),
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
      if(response){
        _showSnackbar(context, "isSuccessful" ," Sale Order Confirmed Successfully");
      }else{
        _showSnackbar(context, "isFailed" ,"⚠️ Failed to confirm Sale Order");
      }
      return response;

    } catch (e) {
      return false;
    }
  }
  void ShowdialogPopup(BuildContext context,UserDataProvider userData,) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Color(0xD0BA8DAD),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
          ),
          child: SizedBox(
            width: 300,
            height: 103,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Confirmed Order ?",style: TextStyle(fontWeight: FontWeight.w800,fontSize: 30),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TapButton(
                      lable: "Confirm",
                      btnColor: mainColor,
                      fontSize: txtNormal,
                      width: 40,
                      height: 20,
                      onPressed: () {
                        confirmedSalesOrder(
                            userData.url,
                            userData.password,
                            userData.database,
                            userData.userId
                        );
                        Navigator.of(context).pop();
                      },

                    ),
                    TapButton(
                      lable: "Cancel",
                      btnColor: mainColor,
                      fontSize: txtNormal,
                      width: 40,
                      height: 20,
                      onPressed: ()async{
                        Navigator.of(context).pop();
                      },
                    )
                  ],)
              ],
            ),
          ),
        );
      },
    );
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
