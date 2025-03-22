import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../constant/colors.dart';

class SoConfOrderlineTab extends StatefulWidget {
  const SoConfOrderlineTab({super.key});

  @override
  State<SoConfOrderlineTab> createState() => _SoConfOrderlineTabState();
}

class _SoConfOrderlineTabState extends State<SoConfOrderlineTab> {
  late DataSource dataSource;
  List<GridColumn> columns = [];
  List <dynamic> loadedDataList = [];
  @override
  @override
  void initState() {
    dataSource = DataSource(loadedDataList: [
      {
        "product" : "Test Product",
        "qty" : "100",
        "unitPrice" : "4500",
        "tax" : "15%",
        "amount" : "\$450,000",
      }
    ]);
    super.initState();
  }
  Widget build(BuildContext context) {
    return SfDataGrid(
      selectionMode: SelectionMode.none,
      source: dataSource,
      columns: getColumns(),
    );
  }
  getColumns(){
    columns = [
      GridColumn(
          columnName: "product",
          columnWidthMode: ColumnWidthMode.fill,
          label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              color: mainColor,
              alignment: Alignment.centerLeft,
              child: const Text(
                "Product",
                style: TextStyle(fontWeight: FontWeight.w800),
                softWrap: false,
              )
          )
      ),
      GridColumn(
          columnName: "qty",
          columnWidthMode: ColumnWidthMode.fill,
          label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              color: mainColor,
              alignment: Alignment.centerRight,
              child: const Text(
                "Quantity",
                style: TextStyle(fontWeight: FontWeight.w800),
                softWrap: false,
              )
          )
      ),
      GridColumn(
          columnName: "unitPrice",
          columnWidthMode: ColumnWidthMode.fill,
          label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              color: mainColor,
              alignment: Alignment.centerRight,
              child: const Text(
                "U Price",
                style: TextStyle(fontWeight: FontWeight.w800),
                softWrap: false,
              )
          )
      ),
      GridColumn(
          columnName: "tax",
          columnWidthMode: ColumnWidthMode.fill,
          label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              color: mainColor,
              alignment: Alignment.centerLeft,
              child: const Text(
                "Taxes",
                style: TextStyle(fontWeight: FontWeight.w800),
                softWrap: false,
              )
          )
      ),
      GridColumn(
          columnName: "amount",
          columnWidthMode: ColumnWidthMode.fill,
          label: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              color: mainColor,
              alignment: Alignment.centerRight,
              child: const Text(
                "Amount",
                style: TextStyle(fontWeight: FontWeight.w800),
                softWrap: false,
              )
          )
      ),

    ];
    return columns;
  }
}
class DataSource extends DataGridSource {
  DataSource({required List loadedDataList}) {
    _employeeData = loadedDataList.map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'product', value: e['product']),
      DataGridCell<String>(columnName: 'qty', value: e['qty']),
      DataGridCell<String>(columnName: 'unitPrice', value: e['unitPrice']),
      DataGridCell<String>(columnName: 'tax', value: e['tax']),
      DataGridCell<String>(columnName: 'amount', value: e['amount']),
    ])).toList();
  }
  List<DataGridRow> _employeeData = [];
  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          if(e.columnName == "qty" || e.columnName == "amount" || e.columnName == "unitPrice"){
            return Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(8.0),
              child: Text(e.value.toString(),overflow: TextOverflow.ellipsis,),
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

