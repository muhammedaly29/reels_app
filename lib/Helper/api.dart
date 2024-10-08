import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<Map<String, dynamic>> get (Uri url) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
} 