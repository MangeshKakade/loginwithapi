import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://reqres.in/api';

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'email': email, 'password': password},
    );
    // "email": "eve.holt@reqres.in",
    // "password": "pistol"
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception('Login failed');
    }
  }
}
