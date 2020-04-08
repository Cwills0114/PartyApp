import 'package:flutter/material.dart';

/*
  Method: display_Event
  Description: Build the Card view for
*/

Widget display_Event(BuildContext context){
  List items = getDummyList();
  
    return Padding(
      padding: EdgeInsets.only(top: 200),
      child: ListView.builder(
        itemCount: items.length, 
        itemBuilder: (context, index){
          return Dismissible(key: Key(items[index]),
           child: Card(
             elevation: 3,
             child: Container(
               height: 50,
               child: Row(
                 children: <Widget> [Text(items[index])],
               ),
             ),
           ) );
        }
        ),
    );
  }
  
List getDummyList() {
  List list = List.generate(20, (i){
    return "Item ${i + 1}";
  });
  return list;
}