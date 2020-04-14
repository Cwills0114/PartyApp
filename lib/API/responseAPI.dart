import 'dart:convert';

import 'package:http/http.dart';
import 'package:flutter/material.dart';

import 'alert.dart';

Future<bool> apiResponse(Response response, BuildContext context) {
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
        print(errorResponse);
        var error = errorResponse['message'];
        print("error: " + error);
        if (error != null) {
          ackAlert(error, context);
        } else {
          ackAlert(
              "Error has Occured, Please check the username and password and try again.",
              context);
        }
        return Future.value(false);
      }
  }
}