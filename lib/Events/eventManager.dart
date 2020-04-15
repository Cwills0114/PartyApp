import 'dart:async';

import 'package:login/API/eventAPI.dart';

import 'event_model.dart';


class eventManager {
  final StreamController<int> _eventCount = StreamController<int>();
  Stream<int> get eventCount => _eventCount.stream;

  Stream<List<eventModel>> get eventListView async* {
    yield await EventAPI.getEvents();
  }
  eventManager(){
    eventListView.listen((list) => _eventCount.add(list.length));
  }

}