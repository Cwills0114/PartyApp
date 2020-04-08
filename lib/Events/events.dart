import 'package:flutter/material.dart';

/*
  Method: display_Event
  Description: Build the Card view for HomePageLayout
*/

Widget display_Event(BuildContext context) {
  List items = getDummyList();

  return Padding(
    padding: EdgeInsets.only(top: 200),
    child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            child: Container(
              height: 125,
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(items[index]),

                      Text(items[index]),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(items[index]),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(items[index]),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
  );
}

List getDummyList() {
  List list = List.generate(20, (i) {
    return "Item ${i + 1}";
  });
  return list;
}
