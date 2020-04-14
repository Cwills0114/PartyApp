import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'responseAPI.dart';

//Create account address
String _createAccount() {
  if (Platform.isAndroid)
    return 'http://10.0.2.2:4000/user/signup';
  else // for iOS simulator
    return 'http://localhost:4000/user/signup';
}


//Create account HTTP Post Request
Future<bool> createAccount(String username, String email, String password, BuildContext context) async {
  print("button pressed");
  final Response response = await post(
    _createAccount(),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, dynamic>{'username': username, 'password': password, 'email': email}),
  );
  print(response.statusCode);
  print(response.body);
  // Take the Respone token
  return(apiResponse(response, context));
  
}