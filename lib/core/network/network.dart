import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHandler {
  final String baseUrl;

  NetworkHandler({required this.baseUrl});

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
}
