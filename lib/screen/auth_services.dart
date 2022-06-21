import 'dart:convert';
import './globals.dart';

import 'package:http/http.dart' as http;

import 'globals.dart';

class AuthServices {
  static Future<http.Response> register(
      String name, String username, String email, String password, String konfirmasi) async {
    Map data = {
      "Email": email,
      "Username": username,
      "Nama": name,
      "password": password,
      "Konfirmasi": konfirmasi
    };
    var body = json.encode(data);
    var url = Uri.parse('http://192.168.43.70:8000/api/auth/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  // static Future<http.Response> login(String username, String password) async {
  //   Map data = {"username": username, "password": password};
  //   var body = json.encode(data);
  //   var url = Uri.parse('http://192.168.43.72/api/auth/login');
  //   http.Response response = await http.post(
  //     url,
  //     headers: headers,
  //     body: body,
  //   );
  //   print(response.body);
  //   return response;
  // }

  static Future<http.Response> login(
    String username, String password) async {
    Map data = {
      "username": username,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse('http://192.168.43.70:8000/api/auth/login');
    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );
    print(response.body);
    return response;
  }
}