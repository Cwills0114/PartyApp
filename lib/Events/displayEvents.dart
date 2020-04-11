import 'package:flutter/material.dart';

/*
  Method: display_Event
  Description: Build the Card view for HomePageLayout
*/

// TODO: Learn data management using StreamBuilder? && prociders??
// https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html
// https://pub.dev/packages/provider

Widget displayEvent(BuildContext context) {
  double screenWidth, screenHeight;
  Size size = MediaQuery.of(context).size;
  screenHeight = size.height;
  screenWidth = size.width;

  List items = getDummyList();
  List locations = [
    "Bristol",
    "London",
    "Bristol",
    "London",
    "Bristol",
    "London",
    "Bristol",
    "London",
    "Bristol",
    "London",
    "Bristol",
    "London"
  ];

  return Padding(
    padding: const EdgeInsets.only(top: 170.0),
    child: SizedBox(
      height: 600,
      // Nested List View. For Location and Card
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Container(
                width: screenWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(locations[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            height: 1)),
                    Expanded(
                      child: displayCard(context, index, items),
                    ),
                  ],
                ));
          }),
    ),
  );
}

List getDummyList() {
  List list = List.generate(20, (i) {
    return "Item ${i + 1}";
  });
  return list;
}

Widget displayCard(BuildContext context, int index, List items) {
  double screenWidth, screenHeight;
  Size size = MediaQuery.of(context).size;
  screenHeight = size.height;
  screenWidth = size.width;
  ScrollController _scrollController = ScrollController(initialScrollOffset: 10); // TODO: Scroll Inital position needs fixing

  return ListView.separated(
      controller: _scrollController,
      addAutomaticKeepAlives: false,
      itemCount: items.length,
      itemBuilder: (context, index) {
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
                      Text("Faraday complex",
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w400,
                              fontSize: 20)),
                      Text("17/01/00"),
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
                    top: 85, left: 30, child: Text("Temporary Description")),
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
      });
}
