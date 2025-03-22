import 'package:flutter/material.dart';
import '../widgets/sales_order_table.dart';

class SalesOrderScreen extends StatefulWidget {
  final Map  salesOrderDataList;
  const SalesOrderScreen({super.key, required this.salesOrderDataList});

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('sales'),
            Expanded(child: SalesOrderTable(salesOrderDataList:widget.salesOrderDataList)),
          ],
        ),
      ),
    );
  }
  // add the sales orders to the table

}
