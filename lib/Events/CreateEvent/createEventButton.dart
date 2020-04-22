import 'package:flutter/material.dart';

import 'createEventForm.dart';

Widget createEventButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
          backgroundColor: Color.fromRGBO(250, 205, 96, 75),
          onPressed: () {
           createEventForm(context);
          },
          tooltip: 'Create Event',
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 30,
          )),
    ),
  );
}
