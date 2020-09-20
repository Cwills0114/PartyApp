import 'dart:async';

import 'package:login/API/getEventAPI.dart';

import '../event_model.dart';

class EventManager {
  final StreamController<int> _eventCount = StreamController<int>();
  Stream<int> get eventCount => _eventCount.stream;

  Stream<List<EventModel>> get eventListView async* {
    yield await EventAPI.getEvents();
  }

  EventManager() {
    eventListView.listen((list) => _eventCount.add(list.length));
  }
}
