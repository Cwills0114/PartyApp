import 'package:flutter/material.dart';
import 'package:login/Events/createEvent/createEventButton.dart';
import '../sideBar.dart';
import '../Events/DisplayEvent/displayEvents.dart';
import 'homePage.dart';

final AssetImage backgroundImage = AssetImage('images/Background.png');

class HomePageLayout extends StatefulWidget {
  @override
  _HomePageLayoutState createState() => _HomePageLayoutState();
}

/*TODO - When creating Calls to service
    Create a state that holds an Async funciton
    Set Loading state to true & display loading icon
    Get the infomation
    Set loading state to false & rebuild widgets

    // Inherited widgets
*/

class _HomePageLayoutState extends State<HomePageLayout> {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: <Widget>[
        SideBar(),
        homePage(context),
        displayEvent(context),
        createEventButton(context)
      ]),
    );
  }
}
