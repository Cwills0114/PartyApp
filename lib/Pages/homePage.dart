import 'package:flutter/material.dart';


final AssetImage backgroundImage = AssetImage('images/Background.png');

Widget homePage(BuildContext context) {
    return Material(
        elevation: 8,
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: backgroundImage,
                fit: BoxFit.fill,
              ),
            ),
            // padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
            child: Container(
                child: Stack(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //mainAxisSize: MainAxisSize.max,
                    children: [
                  Positioned(
                    top: 50,
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
                        Text("27",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 50,
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.bold)),
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
                      child: Icon(Icons.account_circle, size: 50) // Account profile picture
                      )]))));
  }