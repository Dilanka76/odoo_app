import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../constant/colors.dart';

class SoConfOptionalProTab extends StatefulWidget {
  const SoConfOptionalProTab({super.key});

  @override
  State<SoConfOptionalProTab> createState() => _SoConfOptionalProTabState();
}

class _SoConfOptionalProTabState extends State<SoConfOptionalProTab> {
  late DataSource dataSource;
  List<GridColumn> columns = [];
  List <dynamic> loadedDataList = [];
  @override
  @override
  void initState() {
    dataSource = DataSource(loadedDataList:[
      {
        "product" : "Test Product",
        "desc" : "test",
        "qty" : "365",
        "unitPrice" : "15655",
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
          columnName: "desc",
          columnWidthMode: ColumnWidthMode.fill,
          label: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              color: mainColor,
              alignment: Alignment.centerLeft,
              child: const Text(
                "Description",
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
                "Unit Price",
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
      DataGridCell<String>(columnName: 'desc', value: e['desc']),
      DataGridCell<String>(columnName: 'qty', value: e['qty']),
      DataGridCell<String>(columnName: 'unitPrice', value: e['unitPrice']),
    ])).toList();
  }
  List<DataGridRow> _employeeData = [];
  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          if(e.columnName == "qty" || e.columnName == "unitPrice"){
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

