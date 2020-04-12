import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

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

  switch (response.statusCode) {
    case 201:
    case 200:
      {
        print("Switch: true");
        return Future.value(true);
      }
      break;

    default:
      {
        var errorResponse = json.decode(response.body);
        var error = errorResponse['message'];
        print(error);
        if (error != null) {
          _ackAlert(error, context);
        } else {
          _ackAlert(
              "Error has Occured, Please check the username and password and try again.",
              context);
        }
        return Future.value(false);
      }
  }
}

/*
@Method: _ackAlert(String, BuildContext)
@Description: Display a Acknowledgement box based on a string input.
*/

Future<void> _ackAlert(String error, BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('There seems to be an issue with the Login :('),
        content: Text(error),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
