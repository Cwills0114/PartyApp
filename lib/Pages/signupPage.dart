import 'package:flutter/material.dart';
import 'package:login/API/SignupAPI.dart';
import 'package:login/API/loginAPI.dart';
import 'package:passwordfield/passwordfield.dart';

import 'homePageLayout.dart';

class signup extends StatelessWidget {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userController = TextEditingController();
  
  Widget build(BuildContext context) {
    final ThemeData _themeData = Theme.of(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Container(
                  height: 520,
                  width: 330,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/Login_Background.png"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(40, 0, 0, 0),
                        offset: Offset(0, 2.0),
                        blurRadius: 15.0,
                      )
                    ],
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text("Signup",
                            style: _themeData.textTheme
                                .headline), //TODO: Change / Does not use theme file
                        SizedBox(height: 20),
                        Container(
                            width: 260,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(40, 0, 0, 0),
                                  offset: Offset(0, 2.0),
                                  blurRadius: 3.0,
                                )
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: TextField(
                                    controller: userController,
                                    decoration: InputDecoration(
                                        hintText: "Username",
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
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child:  PasswordField(
                                    controller: passwordController,
                                    color: Colors.grey,
                                    hasFloatingPlaceholder: true,
                                    errorMessage: 'must contain special character either . * @ # \$',
                                    ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            child: ButtonTheme(
                              buttonColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(18.0)),
                              child: RaisedButton(
                                child: Center(
                                  child: Text("Create Account",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: "OpenSans",
                                          fontWeight: FontWeight.w600)),
                                ),
                                onPressed: () async {
                                  var createAccountBool = await createAccount(userController.text, emailController.text.trim(), passwordController.text, context);
                                  if(createAccountBool  == true){
                                    Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => homePageLayout()),
                                      );
                                  }
                                },
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Forgot Password");
                          },
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Register"); // Link to Register page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => signup()),
                          );
                        },
                        child: Text(
                          "Already have an account? Sign in",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ]))),
            ],
          ),
        ),
      ),
    );
  }
}
