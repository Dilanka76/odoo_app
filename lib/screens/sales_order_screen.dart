import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odoo_app/constant/sizes.dart';
import 'package:odoo_app/widgets/right_Drawer.dart';
import '../constant/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/left_drawer.dart';
import '../widgets/reuserble widget/tap_button.dart';
import '../widgets/sales_order_table.dart';

class SalesOrderScreen extends StatefulWidget {
  const SalesOrderScreen({super.key,});

  @override
  State<SalesOrderScreen> createState() => _SalesOrderScreenState();
}

class _SalesOrderScreenState extends State<SalesOrderScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBarSection(topic: "Sales Orders",),
            drawer:  Drawer(child: LeftDrawer()),
          endDrawer: Drawer(child: RightDrawer(),),
          body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              Row(
                children: [
                  TapButton(
                    lable: "New",
                    btnColor: mainColor,
                    fontSize: txtNormal,
                    width: 50,
                    height: 40,
                    onPressed: ()async{
                    },
                  ),
                  Expanded(child: Text("Upload",style: TextStyle(fontSize: 20,))),
                  Expanded(child: Text("Quotations",style: TextStyle(fontSize: 20,))),
                  Expanded(child: IconButton(onPressed: (){}, icon:Icon(Icons.settings))),
                ],
              ),
              Expanded(child: SalesOrderTable()),
            ],
          ),
        ),
      ),
    );
  }
  // add the sales orders to the table

}
