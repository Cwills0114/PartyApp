import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'homePageLayout.dart';

// TO DO: Keep track of current user.. TOKENS

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ));

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Center(
                child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
              ],
            )),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/Login_Background.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  child: Padding(
                      padding: EdgeInsets.all(30),
                      child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                          SizedBox(
                            height: 60,
                          ),
                          Container(
                              
                                
                              
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(217, 191, 122, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 15),
                                    )
                                  ]),
                              
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: emailController,
                                      decoration: InputDecoration(
                                          hintText: "Username or Email",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[200]))),
                                    child: TextField(
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Forgot Password",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white),
                              child: GestureDetector(
                                  onTap: () async {
                                    // var loginBool = await loginAccount(emailController.text.trim(), passwordController.text, context);
                                    // if(loginBool  == true){
                                    //   Navigator.push(
                                    //     context, MaterialPageRoute(builder: (context) => homePage()),
                                    //     );
                                    // }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => homePageLayout()),
                                    );
                                  },
                                  child: Center(
                                    child: Text("Login",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  )))
                        ]),
                      ))),
            ),
            Container(
              child: SizedBox(
                height: (80),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
@Method: _LoginAddress()
@Description: Stores the IP for the Login API
*/

String _loginAddress() {
  if (Platform.isAndroid)
    return 'http://10.0.2.2:4000/user/login';
  else // for iOS simulator
    return 'http://localhost:4000/user/login';
}

/*
@Method: loginAccount(String, String, BuildContext)
@Description: Handles the Login Post Request
*/
Future<bool> loginAccount(
    String email, String password, BuildContext context) async {
  final Response response = await post(
    _loginAddress(),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{'email': email, 'password': password}),
  );

  switch (response.statusCode) {
    case 201:
    case 200:
      {
        print("Switch: true");
        return Future.value(true);
      }
      break;

    default:
      {
        var errorResponse = json.decode(response.body);
        var error = errorResponse['message'];
        print(error);
        if (error != null) {
          _ackAlert(error, context);
        } else {
          _ackAlert(
              "Error has Occured, Please check the username and password and try again.",
              context);
        }
        return Future.value(false);
      }
  }
}

/*
@Method: _ackAlert(String, BuildContext)
@Description: Display a Acknowledgement box based on a string input.
*/

Future<void> _ackAlert(String error, BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('There seems to be an issue with the Login :('),
        content: Text(error),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
