import 'package:flutter/material.dart';
import 'package:xml_rpc/client_c.dart' as xml_rpc;

class UserDataProvider with ChangeNotifier{

  String _url ="";
  int _userId = -1;
  String _database = "";
  String  _userName = "";
  String  _password = "";

  List<dynamic> _salesOrderDataList = [];

  String get url => _url;
  int get userId => _userId;
  String get database => _database;
  String get userName => _userName;
  String get password => _password;
  List<dynamic> get salesOrderDataList => _salesOrderDataList;

  // set values to the relavant field
void setUserData ( {required String url, required String database, required String userName, required String password,required }){
   _url = url;
   _database = database;
   _userName = userName;
   _password = password;
  notifyListeners();
}

  // Authenticate user and get user id
  Future<int> fetchUserId(BuildContext context2) async {
    try {
      final userId = await xml_rpc.call(
        Uri.parse('${url}xmlrpc/2/common'),
        'login',
        [_database, _userName, _password],
      );
      print("vvv.eee..$userId");
      if(userId != false){
        _userId =  userId;
         _showSnackbar(context2, "isSuccessful" ,"✅ Login successful! Welcome");
      }else{
        _userId = -1;
        _showSnackbar(context2, "isFailed" ,"⚠️ Sign-in failed. Please check your username and password ");
      }
      notifyListeners();
      return userId;
    } catch (e) {
      return -1;
    }
  }

  // fetch user sales order data;
  Future<List<dynamic>> fetchSalesOrderData() async {
    try {
      final orders = await xml_rpc.call(
        Uri.parse('${_url}xmlrpc/2/object'),
        'execute_kw',
        [_database, _userId, _password, 'sale.order', 'search_read', [],
          {
            'fields': ['name', 'date_order', 'state','amount_total',],
            'limit': 10,
            'order': 'create_date desc',
          },
        ],
      );
      _salesOrderDataList = orders;
      notifyListeners();
      print("vv..hhh..$orders");
      return orders;
    } catch (e) {
      throw Exception('Failed to fetch sale orders: $e');
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
  }

}