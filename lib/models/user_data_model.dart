import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml_rpc/client.dart' as xml_rpc;

class UserDataModel {
  final String url;
  final String database;
  final String username;
  final String password;

  UserDataModel({
    required this.url,
    required this.database,
    required this.username,
    required this.password,
  });

  // Authenticate user and get user id
  Future<int> fetchUserId(BuildContext context) async {
    try {
       final userId = await xml_rpc.call(
        Uri.parse('${url}xmlrpc/2/common'),
        'login',
        [database, username, password],
      );
      if(userId != false){
        // _showSnackbar(context, "isSuccessful" ,"✅ Login successful! Welcome");
      }
      return userId;
    } catch (e) {
      _showSnackbar(context, "isFailed" ,"⚠️ Sign-in failed. Please check your username and password");
      return -1;
    }
  }

// fetch user sales order data;
  Future<List<dynamic>> fetchSalesOrderData(int userId) async {
    try {
      final orders = await xml_rpc.call(
        Uri.parse('${url}xmlrpc/2/object'),
        'execute_kw',
        [database, userId, password, 'sale.order', 'search_read', [],
          {
            'fields': ['name', 'date_order', 'state','amount_total',],
            'limit': 10,
            'order': 'create_date desc',
          },
        ],
      );
      print("vv....$orders");
      return orders;
    } catch (e) {
      throw Exception('Failed to fetch sale orders: $e');
    }
  }


}
void _showSnackbar(BuildContext context,String status , String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message,style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
      backgroundColor: status ==  "isSuccessful" ? Colors.greenAccent : Colors.redAccent,
      behavior: SnackBarBehavior.floating, // Makes it a small popup
      duration: Duration(seconds: 10),
    ),
  );
}