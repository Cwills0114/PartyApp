import 'package:flutter/material.dart';
import '../sideBar.dart';
import '../Events/displayEvents.dart';
import 'homePage.dart';

final AssetImage backgroundImage = AssetImage('images/Background.png');

class homePageLayout extends StatefulWidget {
  @override
  _homePageLayoutState createState() => _homePageLayoutState();
}

/*TO DO - When creating Calls to service
    Create a state that holds an Async funciton
    Set Loading state to true & display loading icon
    Get the infomation
    Set loading state to false & rebuild widgets

    // Inherited widgets
*/

class _homePageLayoutState extends State<homePageLayout> {
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
        //sideBar(),
        homePage(context),
        displayEvent(context)
      ]),
    );
  }
}
