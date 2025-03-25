import 'package:flutter/cupertino.dart';

import '../../models data/so_cong_info_data.dart';

class SoConfOtheinfotab extends StatelessWidget {
  const SoConfOtheinfotab({super.key});

  @override
  Widget build(BuildContext context) {
    SoConfInfoDataSales soConfInfoDataSales = SoConfInfoDataSales();
    SoConfInfoDataInvoicing soConfInfoDataInvoicing = SoConfInfoDataInvoicing();
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: soConfInfoDataSales.soConfDataListSales.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = soConfInfoDataSales.soConfDataListSales[index];
                  FontWeight type = item.itemName == "SALES" ? FontWeight.w700:FontWeight.normal;
                    return Text(item.itemName,style: TextStyle(fontSize: 20,fontWeight:type),);
                },
              ),
            ),
            SizedBox(width: 70,),
            Expanded(
              child: ListView.builder(
                itemCount: soConfInfoDataInvoicing.soConfDataListInvoicing.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = soConfInfoDataInvoicing.soConfDataListInvoicing[index];
                  FontWeight type = item.itemName == "INVOICING" ? FontWeight.w700:FontWeight.normal;
                  return Text(item.itemName,style: TextStyle(fontSize: 20,fontWeight:type),);
                },
              ),
            ),
        ],
    );
  }
}
