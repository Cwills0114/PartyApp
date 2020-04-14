import 'package:flutter/material.dart';

/*
@Method: _ackAlert(String, BuildContext)
@Description: Display a Acknowledgement box based on a string input.
*/

Future<void> ackAlert(String error, BuildContext context) {
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
