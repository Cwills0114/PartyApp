import 'package:flutter/material.dart';
import 'package:login/Events/DisplayEvent/eventManager.dart';
import 'package:login/Events/eventScrollPhysics.dart';
import 'package:login/Events/event_model.dart';
import 'package:login/Pages/userLocation.dart';

/*
  Method: display_Event
  Description: Build the Card view for HomePageLayout
*/

// TODO: Learn data management using StreamBuilder? && prociders??
// https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html
// https://pub.dev/packages/provider

Widget displayEvent(BuildContext context) {
  EventManager manager = EventManager();

  Future<String> _userCity = getUserLocationAddress();

  return Padding(
    padding: const EdgeInsets.only(top: 170.0),
    child: SizedBox(
      height: 600,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FutureBuilder<String>(
              future: _userCity,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                print(snapshot.data);
                children:
                return Text(snapshot.data,
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        height: 2));
              }),
          Expanded(
            child: StreamBuilder(
              stream: manager.eventListView,
              builder: (BuildContext context,
                  AsyncSnapshot<List<EventModel>> snapshot) {
                print(("Error: " + (snapshot.connectionState).toString()));
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                  case ConnectionState.active:
                    return Center(child: CircularProgressIndicator());
                    break;
                  case ConnectionState.done:
                    return displayCard(context, snapshot);
                    break;
                  default:
                    return (Text(
                        "Error" + (snapshot.connectionState).toString()));
                    break;
                }
              },
            ),
          ),
        ],
      ),
    ),
  );
}

Widget displayCard(BuildContext context, AsyncSnapshot snapshot) {
  double screenWidth;
  Size size = MediaQuery.of(context).size;
  screenWidth = size.width;
  ScrollController _scrollController =
      ScrollController(); // TODO: Scroll Inital position needs fixing
  List<EventModel> events = snapshot.data;

  return Container(
    child: MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: ListView.separated(
          physics: EventScrollPhysics(),
          controller: _scrollController,
          addAutomaticKeepAlives: true,
          itemCount: events?.length ?? 0,
          itemBuilder: (context, index) {
            EventModel _event = events[index];
            print(events.length);

            return Container(
              height: 140,
              width: screenWidth - 5,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                elevation: 6,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 15,
                      left: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(_event.title,
                              style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20)),
                          Text(_event.date),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 15,
                        right: 30,
                        child: Icon(Icons.account_circle, size: 50)),
                    Positioned(
                        //TODO: Divider not showing
                        top: 70,
                        child: new SizedBox(
                          height: 10.0,
                          child: new Center(
                            child: new Container(
                              margin: new EdgeInsetsDirectional.only(
                                  start: 1.0, end: 1.0),
                              height: 5.0,
                              color: Colors.red,
                            ),
                          ),
                        )),
                    Positioned(
                        top: 85, left: 30, child: Text(_event.description)),
                    Positioned(
                      bottom: 30,
                      right: 3,
                      child: Column(children: <Widget>[
                        ButtonTheme(
                          minWidth: 10.0,
                          height: 20.0,
                          buttonColor: Color.fromRGBO(250, 205, 96, 75),
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                          ),
                          child: RaisedButton(
                            onPressed: () {
                              // TODO: Button Action for Joining event
                            },
                            child: Text("Join"),
                          ),
                        ),
                        Text("10 People are going",
                            style: TextStyle(height: 0.1, fontSize: 12)),
                      ]),
                    ),
                  ],
                ),
              ),
            );
          },
          //Potenital solution for ADS
          separatorBuilder: (context, index) {
            if (index > 5 && index % 5 == 0) {
              return Center(
                child: Card(
                  color: Colors.red,
                  child: Text("Advetisement"),
                ),
              );
            }
            return SizedBox();
          }),
    ),
  );
}
