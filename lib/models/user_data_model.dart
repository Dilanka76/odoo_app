import 'package:http/http.dart' as http;
import 'package:xml_rpc/client.dart' as xml_rpc;

class OdooService {
  final String url;
  final String db;
  final String username;
  final String password;

  OdooService({
    required this.url,
    required this.db,
    required this.username,
    required this.password,
  });

  // Authenticate and get the user ID (uid)
  Future<int> authenticate() async {
    try {
      final uid = await xml_rpc.call(
        Uri.parse('https://skmjcdev-fluttertest-main-19184952.dev.odoo.com/xmlrpc/2/common'),
        'login',
        ['skmjcdev-fluttertest-main-19184952', 'admin', 'M4BNgeKEFwzJy5V'],
      );
      return uid;
    } catch (e) {
      throw Exception('Authentication failed: $e');
    }
  }

  // Fetch 10 most recent sale orders

}