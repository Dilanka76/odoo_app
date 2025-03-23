import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:odoo_app/constant/colors.dart';
import 'package:odoo_app/providers/user_data.provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../screens/sales_order_confirmed.dart';


class SalesOrderTable extends StatefulWidget {
  const SalesOrderTable({super.key,});

  @override
  State<SalesOrderTable> createState() => _SalesOrderTableState();
}

class _SalesOrderTableState extends State<SalesOrderTable> {

  late DataSource dataSource;
  List<GridColumn> columns = [];
  List <dynamic> loadedDataList = [];

  @override
  void initState() {
    dataSource = DataSource(loadedDataList: loadedDataList);
    super.initState();
    Future.microtask(() {
      final provider = context.read<UserDataProvider>();
      provider.fetchSalesOrderData(); // Fetch data
    });
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final provider = context.watch<UserDataProvider>();
    if (provider.salesOrderDataList.isNotEmpty) {
      addTableData(provider.salesOrderDataList);
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserDataProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: 400,
        child: SfDataGrid(
            selectionMode: SelectionMode.none,
            source: dataSource,
            columns: getColumns(),
          onCellTap: (DataGridCellTapDetails details) {
            int rowIndex = details.rowColumnIndex.rowIndex;
            if (rowIndex > 0) {
              var rowData = loadedDataList[rowIndex - 1];
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SalesOrderConfirmed(
                    orderId:rowData["id"],
                    status:rowData["state"],
                    number:rowData["name"],
                )),
              ).then((value){
                if(value !=null){
                  if(value){
                    userData.fetchSalesOrderData();
                    addTableData(userData.salesOrderDataList);
                    dataSource = DataSource(loadedDataList: loadedDataList);
                  }
                }
              });
            }
          },
        ),
      ),
    );
  }
  getColumns(){
    columns = [
      GridColumn(
          columnName: "select",
          width:45.0,
          label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              color: mainColor,
              alignment: Alignment.centerLeft,
              child: Icon(Icons.check_box)
          )
      ),
      GridColumn(
          columnName: "number",
          width:65.0,
          label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              color: mainColor,
              alignment: Alignment.centerLeft,
              child: const Text(
                "Num",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),
                softWrap: false,
              )
          )
      ),
      GridColumn(
          columnName: "date",
          width:123.0,
          label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              color: mainColor,
              alignment: Alignment.centerLeft,
              child: const Text(
                "Create Date",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),
                softWrap: false,
              )
          )
      ),
      GridColumn(
          columnName: "total",
          width:70.0,
          label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              color: mainColor,
              alignment: Alignment.centerRight,
              child: const Text(
                "Total",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),
                softWrap: false,
              )
          )
      ),
      GridColumn(
          columnName: "status",
          width:86.0,
          label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              color: mainColor,
              alignment: Alignment.center,
              child: const Text(
                "Status",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),
                softWrap: false,
              )
          )
      ),
      GridColumn(
          columnName: "action",
          width:85.0,
          label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              color: mainColor,
              alignment: Alignment.center,
              child: const Text(
                "Action",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w800),
                softWrap: false,
              )
          )
      ),

    ];
    return columns;
  }
  addTableData(list){
    loadedDataList = [];
    //sort the list from date time
    list.sort((a, b) {
      DateTime aNew = DateTime.parse(a['date_order']);
      DateTime bNew = DateTime.parse(b['date_order']);
      return bNew.compareTo(aNew);
    });

    for(dynamic item in list){
      item['action'] = IconButton(
          onPressed: (){}, icon:Icon(Icons.delete,color: Colors.red,)
      );

      // format the date
      DateTime parseDate = DateTime.parse(item['date_order']);
      item['date'] = DateFormat('dd/MM/yyy HH:mm:ss').format(parseDate);
      item['total'] = item['amount_total'];
      item['number'] = item['name'];
      if(item['state'] == 'sale'){
        item['status'] =  Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              color: CupertinoColors.activeGreen,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Center(child: Text('Sales Order',style: TextStyle(fontSize: 10),)),
          ),
        );
      }else{
        item['status'] = Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
                color: CupertinoColors.activeBlue,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Center(child: Text('Quotation',style: TextStyle(fontSize: 10),)),
          ),
        );;
      }
      loadedDataList.add(item);
    }
    dataSource = DataSource(loadedDataList: loadedDataList);
  }
}
class DataSource extends DataGridSource {
  DataSource({required List loadedDataList}) {
    _employeeData = loadedDataList.map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<Widget>(columnName: 'select', value: e['select']),
      DataGridCell<String>(columnName: 'number', value: e['number']),
      DataGridCell<String>(columnName: 'date', value: e['date'].toString()),
      DataGridCell<String>(columnName: 'total', value: '\$${e['total'].toString()}'),
      DataGridCell<Widget>(columnName: 'status', value: e['status']),
      DataGridCell<Widget>(columnName: 'action', value: e['action']),

    ])).toList();
  }
  List<DataGridRow> _employeeData = [];
  List loadedDataList = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          if(e.columnName == "action" || e.columnName == "status"){
            return e.value;
          }
          else if(e.columnName == 'select'){
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Checkbox(
                  value: e.value ?? false,
                  onChanged: (value) {
                    int rowIndex = _employeeData.indexOf(row);
                    if (rowIndex != -1) {
                      _employeeData[rowIndex] = DataGridRow(
                        cells: row.getCells().map<DataGridCell>((cell) {
                          if (cell.columnName == 'select') {
                            return DataGridCell<bool>(columnName: 'select', value: value);
                          }
                          return cell;
                        }).toList(),
                      );
                      notifyListeners();
                    }
                  },)
            );
          }
          else if(e.columnName == "date"){
            return Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(8.0),
              child: Text(e.value.toString(),overflow: TextOverflow.ellipsis,),
            );
          }
          else if(e.columnName == "total"){
            return Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(8.0),
              child: Text(e.value.toString(),overflow: TextOverflow.ellipsis,style: TextStyle(color: CupertinoColors.activeBlue,),),
            );
          }
          else{
            return Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(8.0),
              child: Text(e.value.toString(),overflow: TextOverflow.ellipsis,),
            );
          }
        }).toList());
  }
}
