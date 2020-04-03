

import 'package:flutter/material.dart';


final AssetImage backgroundImage = AssetImage('images/Background.png');

class homePageLayout extends StatefulWidget{
  @override
  _homePageLayoutState createState() => _homePageLayoutState();
}

class _homePageLayoutState extends State<homePageLayout> {
  
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;


    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget> [
         // menu(context),
          homePage(context),
          SizedBox(height: 100,)  
        ]
      ),
    );
  }

Widget menu(BuildContext context){
  //Side Drawer.
}

Widget homePage(BuildContext context){
  return Material(
  
  elevation: 8,
  child: Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: backgroundImage,
        fit: BoxFit.fill,
      ),
    ),
    padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(child: Icon(Icons.menu, color: Colors.black), onTap: (){
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },),
            Text("27 Events", style: TextStyle(color: Colors.black, fontSize: 20)),
            Text("Welcome User", style: TextStyle(color: Colors.black, fontSize: 20)),
            Icon(Icons.account_circle)
          ]
        )
      ],
    )
  )
  );
}
}
