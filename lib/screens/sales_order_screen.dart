import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odoo_app/widgets/right_Drawer.dart';
import '../constant/colors.dart';
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
        appBar: AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: (){
                    Scaffold.of(context).openDrawer();
                    setState(() {
                    });
                  }, icon: Icon(Icons.menu,size: 40,));
            }
          ),
          title: Text('Sales Orders',style: TextStyle(fontWeight:FontWeight.w700,fontSize: 30)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 125,
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.message)
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.alarm)
                      ),
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          return GestureDetector(
                            onTap: (){
                              Scaffold.of(context).openEndDrawer();
                            },
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child:Center(child: Text("A",style: TextStyle(fontWeight:FontWeight.w700,fontSize: 25),))
                              ,
                            ),
                          );
                        }
                      ),
                    )
                  ],
                ),
              ),
            )

          ],
        ),
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
                    fontSize: 20.0,
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
