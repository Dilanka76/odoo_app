import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/left_drawer.dart';
import '../widgets/right_Drawer.dart';
import '../widgets/so confirmed screen widget/so_conf_action_section.dart';
import '../widgets/so confirmed screen widget/so_conf_customer_section.dart';
import '../widgets/so confirmed screen widget/so_conf_header_section.dart';
import '../widgets/so confirmed screen widget/so_conf_tabBar_section.dart';

class SalesOrderConfirmed extends StatefulWidget {
  final int orderId;
  final String status;
  final String number;
  const SalesOrderConfirmed({super.key,required this.orderId, required this.status, required this.number});

  @override
  State<SalesOrderConfirmed> createState() => _SalesOrderConfirmedState();
}

class _SalesOrderConfirmedState extends State<SalesOrderConfirmed> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBarSection(topic: widget.status == "sale" ? "Create Invoice" : "Confirm Order",),
        drawer:  Drawer(child: LeftDrawer()),
        endDrawer: Drawer(child: RightDrawer(),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              SoConfHeader(
                number: widget.number,
                status: widget.status,
              ),
              Divider(),
              SoConfAction(
                  status:widget.status,
                orderId: widget.orderId,
                number: widget.number,
              ),
              Divider(),
              SoConfCstomer(
                number: widget.number,
              ),
              Divider(),
              SoConfTabBar()
            ],
          ),
        ),
      ),
    );
  }
}
