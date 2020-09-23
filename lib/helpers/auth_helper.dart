import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

class Auth with ChangeNotifier {
  Future<String> logIn(String login, String password) async {
    http.Response response;

    String token = '';

    try {
      response = await http.post(authLogIn,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'username': '$login',
            'password': '$password',
          }));

      print('response.statusCode from auth = ${response.statusCode}');

      if (response.statusCode != 200) {
        token = '1';
      }

      if (response.statusCode == 200) {
        token = response.body;
      }
    } catch (error) {
      print('error from login method = $error');

      throw error;
    }

    return token;
  }
}
