import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:login/Events/event_model.dart';

class EventAPI {
/*
@Method: _getEventAddress()
@Description: Stores the IP for the Event API
*/

  static String _getEventAddress() {
    if (Platform.isAndroid)
      return 'http://10.0.2.2:5000/event/getevents';
    else // for iOS simulator
      return 'http://localhost:5000/event/getevents';
  }

/*
@Method: getEvents(BuildContext)
@Description: Handles the event Get Request
*/
  static Future getEvents() async {
    final Response response = await get(
      _getEventAddress(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    List collection = json.decode(response.body);
    return collection.map((json) {
      return EventModel(
        title: json['title'],
        address: json['address'],
        date: json['date'],
        description: json['description'],
      );
    }).toList();
  }
}
