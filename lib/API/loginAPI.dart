import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'responseAPI.dart';


/*
@Method: _LoginAddress()
@Description: Stores the IP for the Login API
*/

String _loginAddress() {
  if (Platform.isAndroid)
    return 'http://10.0.2.2:4000/user/login';
  else // for iOS simulator
    return 'http://localhost:4000/user/login';
}

/*
@Method: loginAccount(String, String, BuildContext)
@Description: Handles the Login Post Request
*/
Future<bool> loginAccount(
    String email, String password, BuildContext context) async {
  final Response response = await post(
    _loginAddress(),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{'email': email, 'password': password}),
  );

  return apiResponse(response, context);
}



