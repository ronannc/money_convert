import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:money_convert/models/currency_model.dart';

class Api {
  final String host = 'https://brapi.dev';

  Future<String> getCurrency(String currency) async {
    String url = '$host/api/v2/currency?currency=$currency';
    http.Response response = await http.get(Uri.parse(url));
    return jsonDecode(response.body)['currency'].toString();
  }
}