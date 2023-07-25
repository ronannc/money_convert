import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:money_convert/models/currency_model.dart';

class ApiService {
  final String host = 'https://brapi.dev';

  Future<List<Currency>> getCurrency(String currency) async {
    String uri = '$host/api/v2/currency?currency=$currency';
    http.Response response = await http.get(Uri.parse(uri));

    List<Currency> list = (jsonDecode(response.body)['currency'] as List)
        .map<Currency>((e) => Currency.fromJson(e))
        .toList();
    return list;
  }
}
