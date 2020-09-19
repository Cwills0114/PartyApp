import 'package:flutter/material.dart';
// import 'package:login/Events/DisplayEvent/eventManager.dart';

final AssetImage backgroundImage = AssetImage('images/Background.png');
double screenWidth, screenHeight;

Widget homePage(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  screenHeight = size.height;
  screenWidth = size.width;
  //final eventManager manager = eventManager();

  return Material(
      elevation: 8,
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: backgroundImage,
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
              child: Stack(children: [
            Positioned(
              top: screenHeight / 12,
              left: 20,
              child: InkWell(
                child: Icon(Icons.menu, color: Colors.black),
                onTap: () {
                  // setState(() {
                  //   //isCollapsed = !isCollapsed;
                  // });
                },
              ),
            ),
            Positioned(
              top: 25,
              left: 100,
              child: Container(
                child: Column(children: [
                  Text("0",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 50,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold)),
                  // StreamBuilder<int>(
                  //   stream: manager.eventCount,
                  //   builder: (context, snapshot) {
                  //     return Text((snapshot.data ?? 0).toString(),
                  //         style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: 50,
                  //             fontFamily: 'OpenSans',
                  //             fontWeight: FontWeight.bold));
                  //   },
                  // ),
                  Text("Events",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'OpenSans',
                          height: 0.3))
                ]),
              ),
            ),
            Positioned(
              top: 50,
              right: 90,
              child: Container(
                child: Column(children: [
                  Text("Welcome",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'OpenSans')),
                  Text("User",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'OpenSans',
                          height: 1))
                ]),
              ),
            ),
            Positioned(
                top: 50,
                right: 25,
                child: Icon(Icons.account_circle,
                    size: 50) // Account profile picture
                )
          ]))));
}
